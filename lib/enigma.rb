require 'date'

class Enigma
  attr_reader :message,
              :key,
              :date
  def initialize(message, key = rand(99999), date = Date.today)
    @message = message
    @key = key
    @date = date
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']


  end


  def encrypt(message,key,date)
    rotation_1 = key.to_s.slice(0,2).to_i
    rotation_2 = key.to_s.slice(1,2).to_i
    rotation_3 = key.to_s.slice(2,2).to_i
    rotation_4 = key.to_s.slice(3,2).to_i



    offset_1 = date_last_4.chars[0].to_i
    offset_2 = date_last_4.chars[1].to_i
    offset_3 = date_last_4.chars[2].to_i
    offset_4 = date_last_4.chars[3].to_i

    total_change_1 = rotation_1 + offset_1
    total_change_2 = rotation_2 + offset_2
    total_change_3 = rotation_3 + offset_3
    total_change_4 = rotation_4 + offset_4
  end

  def formatted_date
    date = Time.now.strftime("%d%m%y").to_i
  end

  def get_offset
    date = Time.now.strftime("%d%m%y").to_i ** 2
    date_string = date.to_s
    date_last_4 = date_string.slice(-4,date_string.length).to_i
  end
end


enigma = Enigma.new("Hello World")
puts enigma.get_offset
# message.split('')

# total_change_array = [total_change_1,total_change_2,total_change_3,total_change_4]
