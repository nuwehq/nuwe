require './test/test_helper'

class UserTest < Minitest::Test
  def test_exists
    assert Nuwe::Admin::User
  end

  def test_attributes
    VCR.use_cassette('one_user') do
      user = Nuwe::Admin::User.find(13405)
      assert_equal Nuwe::User, user.class

      assert_equal 13405, user.id
      assert_equal "diamond.cummerata@corwin.net", user.email
      assert_equal "25.867545346578", user.bmi
      assert_equal "80000.0", user.weight
      assert_equal "1880.0", user.height
      assert_equal "120.0", user.bpm
      assert_equal "110/90", user.blood_pressure
    end
  end

  def test_all
    VCR.use_cassette('all_users') do
      result = Nuwe::Admin::User.all

      assert_equal 25, result.length
      assert_equal Nuwe::User, result.first.class
    end
  end
end
