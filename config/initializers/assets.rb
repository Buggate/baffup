# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( 12main.css )

Rails.application.config.assets.precompile += %w( main.css )

Rails.application.config.assets.precompile += %w( ps_main.css )

Rails.application.config.assets.precompile += %w( login.css )

Rails.application.config.assets.precompile += %w( partyform.css )

Rails.application.config.assets.precompile += %w( stratamain.css )

Rails.application.config.assets.precompile += %w( email.css )



Rails.application.config.assets.precompile += %w( partyform.js )

Rails.application.config.assets.precompile += %w( main.js )

Rails.application.config.assets.precompile += %w( ps_main.js )

Rails.application.config.assets.precompile += %w( 12main.js )

Rails.application.config.assets.precompile += %w( skel.min.js )

Rails.application.config.assets.precompile += %w( stratamain.js )

Rails.application.config.assets.precompile += %w( comments.js )
