desc "Sitemap:refresh is called by the Heroku scheduler add-on"
task :sitemap_refresh => :environment do

  puts "starting sitemap_refresh process"

  	rake sitemap:refresh

  puts "ending sitemap_refresh process"

end