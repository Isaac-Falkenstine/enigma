require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def test_it_exists
    enigma = Enigma.new("Hello World")
    assert_instance_of Enigma, enigma
  end

  def test_todays_date_is_accurate
    enigma = Enigma.new("Hello World")
    assert_equal Date.today, enigma.date
  end

  def test_date_is_in_correct_format
    enigma = Enigma.new("Hello World")
    assert_equal 270818, enigma.formatted_date
  end

  def test_get_individual_offset_numbers
    enigma = Enigma.new("Hello World")
    assert_equal [9,1,2,4], enigma.get_offset
  end

  def test_rotation
    enigma = Enigma.new("Hello World")
    assert_equal [41,15,52,21], enigma.rotation(41521)
  end
end
