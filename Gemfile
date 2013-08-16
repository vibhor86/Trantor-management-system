source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.13'

gem 'rails_admin'
gem 'mysql2'
gem 'devise'
gem 'wisepdf'
gem 'cancan'
gem 'passenger'
gem "audited-activerecord", "~> 3.0"
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'paper_trail', '~> 2'
gem "twitter-bootstrap-rails"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "less-rails"
  gem 'client_side_validations'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

group :development do
  gem 'webrick', '~> 1.3.1'
end

gem 'jquery-datatables-rails', github:'rweng/jquery-datatables-rails'
gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'delayed_job_active_record'
gem "devise-async"
gem "rspec-rails", :group => [:development, :test]
gem "debugger", :group => [:development, :test]
gem "factory_girl_rails", :group => [:development, :test]
gem "email_spec", :group => :test
gem "cucumber-rails", :group => :test, :require => false
gem "capybara", :git => 'git://github.com/jnicklas/capybara.git',:group => [:development, :test]
gem "launchy", :group => :test
gem "database_cleaner",:group => [:development, :test]
gem 'jquery-datatables-tabletools-rails' ,:git => 'git://github.com/kindjal/jquery-datatables-tabletools-rails.git'