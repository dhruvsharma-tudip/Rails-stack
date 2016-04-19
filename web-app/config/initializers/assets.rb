# Be sure to restart your server when you modify this file
Rails.application.config.assets.precompile += %w( logo-big.jpg )
Rails.application.config.assets.precompile += %w( favicon.ico )
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( dangerfield.png )
Rails.application.config.assets.precompile += %w( profile-icon.png )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.scss.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
