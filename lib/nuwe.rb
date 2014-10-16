require 'faraday'
require 'faraday_middleware'

require_relative "nuwe/version"
require_relative "nuwe/configuration"
require_relative "nuwe/admin/user"

module Nuwe
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
