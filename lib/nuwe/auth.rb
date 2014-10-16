module Nuwe
  class Auth < Nuwe::Base

    # Try to log in using email and password.
    #
    # Returns the user on success.
    # Raises an error on failure.
    def self.create(email, password)
      response = conn.post do |request|
        request.url "/v1/auth.json"
        request.body = {session: {email: email, password: password}}
      end

      if response.status == 200
        Nuwe::User.new(response.body["user"])
      else
        raise Nuwe::Error::AuthFailed, response.body
      end
    end

  end
end
