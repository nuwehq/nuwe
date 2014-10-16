require './test/test_helper'

class AuthTest < Minitest::Test

  def test_auth_success
    VCR.use_cassette('auth_success') do
      response = Nuwe::Auth.create 'me@example.com', 'supersecret'

      assert_equal Nuwe::User, response.class
      assert_equal "me@example.com", response.email
    end
  end

  def test_auth_not_found
    VCR.use_cassette('auth_not_found') do
      assert_raises Nuwe::Error::AuthFailed do
        Nuwe::Auth.create 'me@example.com', 'ohnoesinvalid'
      end
    end
  end

end
