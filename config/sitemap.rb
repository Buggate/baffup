
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.baffsup.com"

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
  fog_provider: 'AWS',
  aws_access_key_id:         ENV["AWS_ACCESS_KEY_ID"],
  aws_secret_access_key:     ENV["AWS_SECRET_ACCESS_KEY"],
  fog_directory:  ENV['S3_my_BUCKET_NAME'],
  fog_region:                ENV["AWS_REGION"])



SitemapGenerator::Sitemap.sitemaps_host = ENV['S3_HOST_NAME']


SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.public_path = 'tmp/'

SitemapGenerator::Sitemap.create do

  Party.find_each do |party|
    add @party
end

 Visitor.find_each do |visitor|
    add @visitor
end





  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end

