require './lib/enigma'
require 'date'

class Offset
  def get_offset
    date = Time.now.strftime("%d%m%y").to_i ** 2
    date_string = date.to_s
    date_last_4 = date_string.slice(-4,date_string.length)
    offset_1 = date_last_4.chars[0].to_i
    offset_2 = date_last_4.chars[1].to_i
    offset_3 = date_last_4.chars[2].to_i
    offset_4 = date_last_4.chars[3].to_i
    [offset_1,offset_2,offset_3,offset_4]
  end
end
