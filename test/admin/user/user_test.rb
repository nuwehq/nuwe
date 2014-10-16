require './test/test_helper'

class UserTest < Minitest::Test
  def test_exists
    assert Nuwe::Admin::User
  end

  def test_attributes
    VCR.use_cassette('one_user') do
      user = Nuwe::Admin::User.find(4370)
      assert_equal Nuwe::Admin::User, user.class

      assert_equal 4370, user.id
      assert_equal "diamond.cummerata@corwin.net", user.email
      assert_equal "25.867545346578", user.bmi
      assert_equal "80000.0", user.weight
      assert_equal "1880.0", user.height
      assert_equal "120.0", user.bpm
      assert_equal "110/90", user.blood_pressure
    end
  end
end
