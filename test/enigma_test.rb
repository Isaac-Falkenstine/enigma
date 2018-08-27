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

  def test_rotation_if_given_key_value
    enigma = Enigma.new("Hello World")
    assert_equal [41,15,52,21], enigma.rotation(41521)
  end

  def test_total_ration
    enigma = Enigma.new("Hello World")
    enigma.rotation(41521)
    enigma.get_offset
    assert_equal [50,16,54,25], enigma.total_rotation
  end

  def test_gets_indexes_of_message
    enigma = Enigma.new("Hello World")
    assert_equal [7,4,11,11,14,36,22,14,17,11,3], enigma.gets_indexes_of_message
  end

  def test_adds_index_to_rotation
    enigma = Enigma.new("Hello World")
    enigma.rotation(41521)
    enigma.get_offset
    enigma.total_rotation
    enigma.gets_indexes_of_message
    assert_equal [57, 20, 65, 36, 64, 52, 76, 39, 67, 27, 57], enigma.adds_rotation_to_index
  end
end
