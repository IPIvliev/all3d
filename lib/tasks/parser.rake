namespace :parsing do

	desc "Parsing from 3ders"
	task :ders => :environment do



		url = 'http://www.3ders.org'
		html = open(url)

		doc = Nokogiri::HTML(html)

		links = doc.css("div.art-layout-cell p a")

		links = links.reject{ |l| l.text.strip != "More" }

		links = links[0...1]

		articles = links.map do |link|
			if (link.text.strip == 'More')
				article_href = link.attr('href')
				article_href.slice!(0)

				url = 'http://www.3ders.org'+article_href
				html = open(url)
				doc = Nokogiri::HTML(html)

				title = doc.css('div.art-postmetadataheader h2.art-postheader').text
				body = doc.css('div.art-layout-cell p')
				body = body.to_s
				body = body.split("Posted in")
				text = body.first

				page = MetaInspector.new(url)
				description = page.description
				keywords = page.meta_tag['name']['keywords']
				images = page.images.with_size
				doctext = Nokogiri::HTML(text)
				danda = doctext.css("p").first.to_s.split(" | By ")
				dateofcreation = danda.first.tr("<p>", "")
				author = danda.last.tr("</p>", "")

				images = images.reject{ |i| i[1] < 540 }

				{
					url: url,
					title: title,
					text: text,
					description: description,
					keywords: keywords,
					dateofcreation: dateofcreation,
					author: author
				}		

				unless Post.where("url = ?", url).present?
					I18n.locale = :en
					post = Post.create(url: url, title: title, text: text,
					 user_id: 1, description: description, keywords: keywords,
					 author: author, date_of_creation: dateofcreation)
					images.each do |image|
						file = open(image[0])
						image = post.postimages.build(:file => file)
						image.save!
						file.close
					end

					doc = Nokogiri::HTML(post.text) 
					i = post.postimages.last.id

					doc.css("img").map do |img|
							img["src"] = "http://localhost:3000#{post.postimages.find(i).file.url}"
					  	i -= 1
					end
					I18n.locale = :en
					post.update_attribute(:text, doc)
					post.save

					puts "Статья #{title} добавлена. Знаки: #{text.length}. Изображения #{images.count}"
				else
					puts "Уже есть такая статья. Знаки: #{text.length}"
					break
				end
			end		
		end
	end

	desc "Parsing from 3ders"
	task :product_ders => :environment do



		url = 'http://www.3ders.org'
		html = open(url)

		doc = Nokogiri::HTML(html)

		links = doc.css("div.art-layout-cell p a")

		links = links.reject{ |l| l.text.strip != "More" }

		links = links[0...3]

		articles = links.map do |link|
			if (link.text.strip == 'More')
				article_href = link.attr('href')
				article_href.slice!(0)

				url = 'http://www.3ders.org'+article_href
				html = open(url)
				doc = Nokogiri::HTML(html)

				title = doc.css('div.art-postmetadataheader h2.art-postheader').text
				body = doc.css('div.art-layout-cell p')
				body = body.to_s
				body = body.split("Posted in")
				text = body.first

				page = MetaInspector.new(url)
				description = page.description
				keywords = page.meta_tag['name']['keywords']
				images = page.images.with_size
				doctext = Nokogiri::HTML(text)
				danda = doctext.css("p").first.to_s.split(" | By ")
				dateofcreation = danda.first.tr("<p>", "")
				author = danda.last.tr("</p>", "")

				images = images.reject{ |i| i[1] < 540 }

				{
					url: url,
					title: title,
					text: text,
					description: description,
					keywords: keywords,
					dateofcreation: dateofcreation,
					author: author
				}		

				unless Post.where("url = ?", url).present?
					I18n.locale = :en
					post = Post.create(url: url, title: title, text: text,
					 user_id: 1, description: description, keywords: keywords,
					 author: author, date_of_creation: dateofcreation)
					images.each do |image|
						file = open(image[0])
						image = post.postimages.build(:file => file)
						image.save!
						file.close
					end

					doc = Nokogiri::HTML(post.text) 
					i = post.postimages.last.id

					doc.css("img").map do |img|
							img["src"] = "http://all3dprinters.ru#{post.postimages.find(i).file.url}"
					  	i -= 1
					end
					I18n.locale = :en
					post.update_attribute(:text, doc)
					post.save

					puts "Статья #{title} добавлена. Знаки: #{text.length}. Изображения #{images.count}"
				else
					puts "Уже есть такая статья. Знаки: #{text.length}"
					break
				end
			end		
		end
	end

end