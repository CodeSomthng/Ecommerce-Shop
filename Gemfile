# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'cancancan', '~> 3.3'
gem 'devise', '~> 4.8'
gem 'fasterer', '~> 0.9.0'
gem 'overcommit', '~> 0.58.0'
gem 'pg_search', '~> 2.3'
gem 'rspec-rails', '~> 5.0'
gem 'shoulda-matchers', '~> 5.0'

gem 'rubocop', '~> 1.23', require: false
gem 'rubocop-performance', '~> 1.12'
gem 'rubocop-rails', '~> 2.12'
gem 'rubocop-rspec', '~> 2.6'

gem 'pg', '~> 1.2'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
