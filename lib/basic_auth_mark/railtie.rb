require 'rails'

module BasicAuthMark
  class Railtie < Rails::Railtie
    initializer "basic_auth_mark.insert_middleware" do |app|
      app.config.middleware.use(BasicAuthMark::Middleware)
    end

    config.basic_auth_mark = ActiveSupport::OrderedOptions.new

    config.after_initialize do
      options = config.basic_auth_mark
      BasicAuthMark.position = options.position if options.position
      BasicAuthMark.color = options.color if options.color
      BasicAuthMark.markable_ip_addresses = options.markable_ip_addresses if options.markable_ip_addresses
    end
  end
end
