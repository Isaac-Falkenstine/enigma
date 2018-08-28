require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'pry'

class EnigmaTest < MiniTest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end


  def test_total_rotation
    enigma = Enigma.new
    enigma.encrypt("hello world", 41521, 270818)
    assert_equal [50,16,54,25], enigma.total_rotation
  end

  def test_gets_indexes_of_message
    enigma = Enigma.new

    assert_equal [7,4,11,11,14,36,22,14,17,11,3], enigma.gets_indexes_of_message("Hello world")
  end

  def test_adds_index_to_rotation
    enigma = Enigma.new
    enigma.encrypt("Hello world", 41521, 270818)
    assert_equal [57, 20, 65, 36, 64, 52, 76, 39, 67, 27, 57], enigma.adds_rotation_to_index("Hello world")
  end

  def test_it_encrypts
    enigma = Enigma.new

    expected = "su0 zn.a21s"
    actual = enigma.encrypt("hello world", 41521, 270818)

    assert_equal expected, actual
  end

  def test_can_run_without_arguements
    enigma = Enigma.new
    actual = enigma.encrypt("Hello world")
    assert_instance_of String, actual
    assert_equal 11, actual.length
  end

  def test_can_decrypt_encrypted_messages
    enigma = Enigma.new

    expected = "hello world"
    actual = enigma.decrypt("su0 zn.a21s", 41521, 270818)

    assert_equal expected, actual
  end
end
