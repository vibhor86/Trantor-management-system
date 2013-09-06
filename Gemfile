source 'http://bundler-api.herokuapp.com'

ruby '1.9.3'
gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "less-rails"
  gem 'client_side_validations'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "better_errors"
  gem 'webrick'
end

group :test do
  gem 'email_spec'
  gem 'launchy'
end

group :development, :test do
  gem 'mysql2'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'debugger'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

# group :ui
  gem 'bootstrap-sass', ">= 2.2.2.0"
  gem 'twitter-bootstrap-rails'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
  gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
  gem 'jquery-datatables-tabletools-rails' ,:git => 'git://github.com/kindjal/jquery-datatables-tabletools-rails.git'
# end

gem 'cancan'
gem 'devise'
gem 'wisepdf'
gem "audited-activerecord", "~> 3.0"
gem 'therubyracer'
gem "binding_of_caller"
gem 'delayed_job_active_record'
gem 'devise-async'
gem 'rufus-scheduler'
gem 'debugger'
gem 'annotate', '>=2.5.0'
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'active_scaffold', :git => 'git://github.com/activescaffold/active_scaffold.git'