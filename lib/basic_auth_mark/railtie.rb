require 'rails'

module BasicAuthMark
  class Railtie < Rails::Railtie
    initializer "basic_auth_mark.insert_middleware" do |app|
      app.config.middleware.use(BasicAuthMark::Middleware)
    end
  end
end
