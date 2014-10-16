require 'faraday'
require 'faraday_middleware'

require_relative "nuwe/version"
require_relative "nuwe/configuration"

require_relative "nuwe/base"
require_relative "nuwe/user"
require_relative "nuwe/auth"

require_relative "nuwe/admin/user"

module Nuwe

  module Error
    class AuthFailed < StandardError; end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
