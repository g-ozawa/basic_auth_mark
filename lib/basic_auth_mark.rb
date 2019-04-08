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

    def color
      @color ||= '880000'
    end

    def color=(color)
      @color = color
    end

    def markable_ip_addresses
      @markable_ip_addresses ||= []
    end

    def markable_ip_addresses=(markable_ip_addresses)
      if markable_ip_addresses.is_a?(Array)
        @markable_ip_addresses = markable_ip_addresses
      else
        @markable_ip_addresses = [markable_ip_addresses]
      end
    end
  end
end
