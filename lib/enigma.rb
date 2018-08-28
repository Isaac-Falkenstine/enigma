require 'date'
require 'pry'
require './lib/rotation'

class Enigma
  def initialize
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']
    @rotation_array = nil
    @offset_array = nil
  end


  def encrypt(message, key = rand(10000..99999),date = Date.today)
    rotor = Rotation.new(key)
    @rotation_array = rotor.rotation
    get_offset
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
    get_offset
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

  def formatted_date
    date = Time.now.strftime("%d%m%y").to_i
  end

  def get_offset
    date = Time.now.strftime("%d%m%y").to_i ** 2
    date_string = date.to_s
    date_last_4 = date_string.slice(-4,date_string.length)
    offset_1 = date_last_4.chars[0].to_i
    offset_2 = date_last_4.chars[1].to_i
    offset_3 = date_last_4.chars[2].to_i
    offset_4 = date_last_4.chars[3].to_i
    @offset_array = [offset_1,offset_2,offset_3,offset_4]
  end

  def total_rotation
    total_change_1 = @rotation_array[0] + @offset_array[0]
    total_change_2 = @rotation_array[1] + @offset_array[1]
    total_change_3 = @rotation_array[2] + @offset_array[2]
    total_change_4 = @rotation_array[3] + @offset_array[3]
    total_change_array = [total_change_1, total_change_2, total_change_3, total_change_4]
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
