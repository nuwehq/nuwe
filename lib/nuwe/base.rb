module Nuwe
  # Base class with common methods. # :nodoc:
  class Base

    private

    def self.conn
      Faraday.new({
        url: Nuwe.configuration.endpoint,
        headers: {
          'Authorization' => "Token token=\"#{Nuwe.configuration.token}\""
        }
      }) do |faraday|
        faraday.request :json
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.use FaradayMiddleware::EncodeJson
        faraday.use FaradayMiddleware::ParseJson
      end
    end

  end

end
