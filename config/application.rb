require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module EcommerceShop
  class Application < Rails::Application
    config.load_defaults 6.1
    config.serve_static_assets = true
  end
end
