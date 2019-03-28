require 'rack'
require 'basic_auth_mark/mark'
require 'basic_auth_mark/middleware'
require "basic_auth_mark/version"
require 'basic_auth_mark/railtie' if defined?(Rails)

module BasicAuthMark
  class << self
    def position
      @position ||= 'right-top'
    end

    def position=(position)
      @position = position
    end
  end
end
