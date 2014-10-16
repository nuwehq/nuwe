module Nuwe
  module Admin
    # Work with users who are not you.
    class User

      class << self

        # Find a user with the given id.
        def find(id)
          response = conn.get do |request|
            request.url "/v1/admin/users/#{id}.json"
          end

          Nuwe::User.new(response.body["user"])
        end

        # Returns a paginated list of users.
        def all
          response = conn.get do |request|
            request.url "/v1/admin/users.json"
          end

          response.body["users"].map {|attributes| Nuwe::User.new(attributes)}
        end

        private

        def conn
          Faraday.new({
            url: Nuwe.configuration.endpoint,
            headers: {
              'Content-Type' => 'application/json',
              'Authorization' => "Token token=\"#{Nuwe.configuration.token}\""
              }
            }) do |faraday|
            faraday.response :logger
            faraday.adapter Faraday.default_adapter
            faraday.use FaradayMiddleware::ParseJson
          end
        end

      end

    end
  end
end
