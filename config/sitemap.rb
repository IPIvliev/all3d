# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://all3dprinters.ru"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  Article.where("active = true").find_each do |article|
    add article_path(article), :lastmod => article.updated_at, :changefreq => 'monthly', :priority => 1.0
  end

  Post.where("active = true").find_each do |post|
    add post_path(post), :lastmod => post.updated_at, :changefreq => 'monthly', :priority => 1.0
  end

  Model.where("active = true").find_each do |model|
    add model_path(model), :lastmod => model.updated_at, :changefreq => 'monthly', :priority => 1.0
  end

  Project.where("active = true").find_each do |model|
    add project_path(project), :lastmod => project.updated_at, :changefreq => 'monthly', :priority => 1.0
  end

  add '/contacts.html', :priority => 0.3, :changefreq => 'yearly'
end