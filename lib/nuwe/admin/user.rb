module Nuwe
  module Admin
    class User

      attr_reader :id, :email, :bmi, :weight, :height, :bpm, :blood_pressure

      def initialize(attributes)
        @id = attributes["id"]
        @email = attributes["email"]
        @bmi = attributes["bmi"]
        @weight = attributes["weight"]
        @height = attributes["height"]
        @bpm = attributes["bpm"]
        @blood_pressure = attributes["blood_pressure"]
      end

      def self.find(id)
        conn = Faraday.new Nuwe.configuration.endpoint do |faraday|
          faraday.response :logger
          faraday.adapter Faraday.default_adapter
          faraday.use FaradayMiddleware::ParseJson
        end

        response = conn.get do |request|
          request.url "/v1/admin/users/#{id}.json"
          request.headers['Content-Type'] = 'application/json'
          request.headers['Authorization'] = "Token token=\"#{Nuwe.configuration.token}\""
        end

        new(response.body["user"])
      end
    end
  end
end
