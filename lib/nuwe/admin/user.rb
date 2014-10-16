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
        conn = Faraday.new url: "https://api.nuapi.co" do |faraday|
          faraday.response :logger
          faraday.adapter Faraday.default_adapter
          faraday.use FaradayMiddleware::ParseJson
        end

        response = conn.get do |request|
          request.url "/v1/users/#{id}.json"
          request.headers['Content-Type'] = 'application/json'
          request.headers['Authorization'] = "Token token=\"65801fd1-3d94-4599-9d06-475b5ee01e28\""
        end

        new(response.body)
      end
    end
  end
end
