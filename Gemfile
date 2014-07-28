source 'https://rubygems.org'

ruby "2.1.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'


# Gems - General List
gem 'pg' # Use postgresql as the database for Active Record
gem 'jbuilder', '~> 2.0'
gem 'json'
gem 'aasm', '~> 3.1.1' # Acts As State Machine
gem "recaptcha", :require => "recaptcha/rails"
gem 'rubocop' # Rubocop code checker


# Devise Authentication
gem 'devise'


# Page Setup
gem 'will_paginate'


# Let's use Twitter Boostrap.
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'


# CSS Gems
gem 'sass-rails', '~> 4.0.3' # Use SCSS for stylesheets


# Javascript Gems
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'therubyracer', platforms: :ruby  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'uglifier', '~> 2.5.3' # Use UglifyJS as compressor for JavaScript assets


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'


# We are submitting assignments by inserting them into a Google Spreadsheet.
# This gem makes it easy to read/write these sheets.
gem 'google_drive'


# File attachements
gem 'paperclip'
gem 'aws-sdk', '~> 1.5.8' # Used by paperclip S3 storage


group :development do
  gem 'rails_layout'
  gem 'debugger' # Use debugger
  gem 'better_errors'
  gem 'binding_of_caller' # used with 'better_errors'
end


group :development, :test do
  gem 'factory_girl_rails' # makes creating complex objects easier in tests
  gem 'capybara'  # allows for user browser simulation in integration testing
end


# Heroku needs this since the Rails plugin system was removed in Ruby 4.
group :production do
  gem 'rails_12factor' #for heroku
end


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development
