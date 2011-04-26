source 'http://rubygems.org'

gem 'rails', '3.0.4'
gem 'devise'
gem 'kaminari'
gem 'cancan'
gem 'meta_search'
gem 'fastercsv'

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
end

group :test do
	gem 'cucumber-rails'
	gem 'capybara'
	gem 'launchy'
end

gem 'mysql', :group => [:staging, :production]
gem 'unicorn', :group => [:staging, :production]

gem 'sqlite3-ruby', :require => 'sqlite3', :group => [:development, :test]
gem 'rspec-rails', '>= 2.0.1', :group => [:development, :test]