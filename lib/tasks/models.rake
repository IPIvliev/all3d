namespace :pmodels do

	desc "Parsing from 3ders"
	task :things => :environment do

		url = 'https://www.thingiverse.com/explore/newest/3d-printing/'
		html = open(url)

		doc = Nokogiri::HTML(html)

		links = doc.css("div.thing div a.thing-img-wrapper")

		links = links[0...12]

		models = links.map do |link|
			model_href = link.attr('href')

			url = 'https://www.thingiverse.com'+model_href
			html = open(url)
			doc = Nokogiri::HTML(html)

			title = doc.css('div.thing-header-data h1').first.text
			summary = doc.css('div#description p').text
			author = doc.css('div.thing-header-data h2 a').first.text

#			page = MetaInspector.new(url)
#			images = page.images.with_size
#			images = images.reject{ |i| i[1] < 480 }

			images = doc.css('div.thing-gallery-holder div.main-slider div.thing-page-image')
			images = images.map { |i| i.attr('data-large-url')}

			downloads = 'https://www.thingiverse.com'+model_href+'/zip'

			{
				url: url,
				title: title,
				description: summary,
				author: author
			}

			unless Model.where("url = ?", url).present? && images.present? && images.count <= 10
				model = Model.create(url: url, title: title, description: summary,
				 	   user_id: 1, author: author, active: true)
				images.each do |image|
					file = open(image)
					image = model.images.build(:file => file)
					image.save!
					file.close
				end


				file = open(downloads)
				stl = model.stls.build(:file => file)
				stl.save!
				file.close


				puts "Модель #{title} добавлена. Изображения #{images.count}."
			else
				puts "Уже есть такая модель."
				break
			end

		end

	end
end