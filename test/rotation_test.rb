require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation'
require 'pry'

class RotationTest < MiniTest::Test
  def test_it_exists
    rotor = Rotation.new(41521)
    assert_instance_of Rotation, rotor
  end

  def test_rotation_if_given_key_value
    enigma = Enigma.new
    rotor = Rotation.new(41521)
    assert_equal [41,15,52,21], rotor.rotation
  end
end
