ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'rspec/autorun'
require 'database_cleaner'
require 'capybara/rspec'
require 'coveralls'
require 'support/subdomains'
require 'factory_girl_rails'
Coveralls.wear!

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

# Capybara.app_host = 'http://example.com'
# Capybara.app_host = "http://mysubdomain.lvh.me/"

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  #config.include Devise::TestHelpers, type: :controller
  config.include Rails.application.routes.url_helpers
  config.order = "random"

  config.before(:suite) do
    # Clean all tables to start
    DatabaseCleaner.clean_with(:truncation)
    # Use transactions for tests
    DatabaseCleaner.strategy = :transaction
    # Truncating doesn't drop schemas, ensure it's clean, app *may not* exist
    Apartment::Tenant.drop('test-schema') rescue nil
    # Create the default tenant for tests
    Account.create!(subdomain: 'test-schema',
                    owner: User.create(username: "boaty",
                                       email: "boaty@mcboatface.com",
                                       password: "password",
                                       password_confirmation: "password"))
  end

  config.before(:each) do
    # Start transaction for this test
    DatabaseCleaner.start
    # Switch into the default tenant
    # Apartment::Tenant.switch! 'test-schema'
  end

  config.after(:each) do
    # Reset tentant back to `public`
    Apartment::Tenant.reset
    # Rollback transaction
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
