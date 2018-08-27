require 'date'
require 'pry'

class Enigma
  attr_reader :message,
              :key,
              :date,
              :rotation_array,
              :offset_array
  def initialize(message, key = rand(10000..99999), date = Date.today)
    @message = message
    @key = key
    @date = date
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']
    @rotation_array = rotation_array
    @offset_array = offset_array
  end


  def encrypt(message,key,date)
  end

  def rotation(key = rand(10000..99999))
    rotation_1 = key.to_s.slice(0,2).to_i
    rotation_2 = key.to_s.slice(1,2).to_i
    rotation_3 = key.to_s.slice(2,2).to_i
    rotation_4 = key.to_s.slice(3,2).to_i
    @rotation_array = [rotation_1,rotation_2,rotation_3,rotation_4]
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
end


enigma = Enigma.new("Hello World")
puts enigma.rotation(41521)
puts enigma.get_offset
puts enigma.total_rotation
