# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += [
  # compile main files (JS and CSS)
  'main.js', 'application.*', 'admin.*', 'public.*', 'login.*',
  #compile subdirectories (JS only, CSS children are 'required')
  'application/*.js', 'admin/*.js', 'public/*.js', 'login/*.js'
]