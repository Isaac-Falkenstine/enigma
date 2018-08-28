require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require 'pry'

class OffsetTest < MiniTest::Test
  def test_it_exists
    offset = Offset.new
    assert_instance_of Offset, offset
  end

  def test_get_individual_offset_numbers
    enigma = Enigma.new
    offset = Offset.new
    assert_equal [9,1,2,4], offset.get_offset
  end
end
