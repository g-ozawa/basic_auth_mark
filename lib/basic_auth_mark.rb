require 'rack'
require 'basic_auth_mark/mark'
require 'basic_auth_mark/middleware'
require "basic_auth_mark/version"

require 'basic_auth_mark/railtie' if defined?(Rails)
