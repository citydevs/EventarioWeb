source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.3'
gem 'high_voltage'
gem 'haml'
gem 'haml-rails', :group => :development
gem 'devise'
gem 'jquery-ui-rails'

gem 'cancancan', '~> 1.8'
# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem "better_errors"
  gem 'spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess'
  gem 'annotate'
  gem 'pry'
  gem "quiet_assets", "~> 1.0.2"

end

group :test do

  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'libnotify'
  gem 'factory_girl_rails'
  gem 'coveralls',  require: false
end
gem 'will_paginate', '~> 3.0'
gem "geocoder"
gem 'friendly_id', '~> 5.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Gem for Postgress


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'pg'
end
