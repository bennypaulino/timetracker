Apartment.configure do |config|
  config.seed_after_create = true
  # config.excluded_models = ['Account']
  config.tenant_names = -> { Account.pluck(:subdomain) }
end
