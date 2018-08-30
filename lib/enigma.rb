require 'date'
require 'pry'
require './lib/rotation'
require './lib/offset'

class Enigma
  def initialize
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']
    @rotation_array = nil
    @offset_array = nil
  end

  def encrypt(message, key = rand(10000..99999),date = Date.today)
    rotor = Rotation.new(key)
    @rotation_array = rotor.rotation
    offset = Offset.new
    @offset_array = offset.get_offset
    encryped_message = []
    adds_rotation_to_index(message).each do |rotation|
      new_index = @character_map.rotate(rotation)
      encryped_message << new_index.first
    end
    encryped_message.join
  end

  def decrypt(message, key, date = Date.today)
    rotor = Rotation.new(key)
    @rotation_array = rotor.rotation
    offset = Offset.new
    @offset_array = offset.get_offset
    decrypted_message = []
    subtract_total_rotation_from_index(message).each do |rotation|
      new_index = @character_map.rotate(rotation)
      decrypted_message << new_index.first
    end
    decrypted_message.join
  end

  def subtract_total_rotation_from_index(message)
    rotated_indexes_array = gets_indexes_of_message(message).map.with_index do |n, i|
      n - total_rotation[i % total_rotation.length]
    end
    rotated_indexes_array
  end


  def total_rotation
    x = 0
    total_change_array = []
    4.times do
      total_change_array << @rotation_array[x] + @offset_array[x]
      x += 1
    end
    total_change_array
  end


  def gets_indexes_of_message(message)
    indexed_message = []
    message_array = message.downcase.split('')
    message_array.each do |i|
      @character_map.each do |x|
        if i == x
          indexed_message << @character_map.index(x)
        end
      end
    end
    indexed_message
  end

  def adds_rotation_to_index(message)
    rotated_indexes_array = gets_indexes_of_message(message).map.with_index do |n, i|
      n + total_rotation[i % total_rotation.length]
    end
    rotated_indexes_array
  end
end
