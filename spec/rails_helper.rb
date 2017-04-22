# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

# Add additional requires below this line. Rails is not loaded until this point!
require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
# Capybara.app_host = "http://*.lvh.me/"
# Capybara.configure do |config|
#   config.always_include_port = true
# end
# lvh.me resolves to 127.0.0.1
# Capybara.app_host = "http://lvh.me/"
# Capybara.server_port = 3001
# Capybara.app_host = 'http://random-subdomain.example.com:3001'
# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(
#     app,
#     url_whitelist: ["lvh.me", "*.lvh.me"],
#     timeout: 60
#     )
# end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
