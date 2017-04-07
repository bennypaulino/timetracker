source 'https://rubygems.org'

gem 'rails', '4.2.8'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Sass-powered version of Bootstrap 3
gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

gem 'sprockets-rails', '>= 2.1.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :test do
  # Powerful matchers for testing models & controllers
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'
  gem 'guard'
  # Auto-reload browser when files are saved.
  gem 'guard-livereload'
  # Run tests when files are saved.
  gem 'guard-rspec'
  gem 'rspec-rails'
  # Integration testing for Rails.
  gem 'capybara'
  # Factories for instances of an ActiveRecord object.
  gem 'factory_girl_rails'
  # Clean up the database after test runs.
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Speed up page load times, and see Heroku Log errors.
gem 'rails_12factor', group: :production
