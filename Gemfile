source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem 'jquery-rails', '~> 4.1', '>= 4.1.1'
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap-social-rails"
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'bootstrap-will_paginate', '~> 0.0.10'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'rails-html-sanitizer', '~> 1.0', '>= 1.0.3'
gem 'sdoc', '~> 0.4.1', group: :doc
gem "bcrypt"
gem "config"
gem 'faker',                   '1.4.2'
gem 'carrierwave',             '0.10.0'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.36.0'
gem 'puma', '~> 3.7'

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  gem "sqlite3"
  gem "byebug", platform: :mri
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.1.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg"
  gem "rails_12factor"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]