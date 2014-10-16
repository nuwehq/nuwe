module Nuwe
  class Configuration
    attr_accessor :endpoint
    attr_accessor :token

    def initialize
      @endpoint = "https://api.nuapi.co"
    end
  end
end
