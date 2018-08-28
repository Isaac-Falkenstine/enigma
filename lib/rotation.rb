require './lib/enigma'

class Rotation
  def initialize(key)
    @key = key
  end
  def rotation
    rotation_1 = @key.to_s.slice(0,2).to_i
    rotation_2 = @key.to_s.slice(1,2).to_i
    rotation_3 = @key.to_s.slice(2,2).to_i
    rotation_4 = @key.to_s.slice(3,2).to_i
    [rotation_1,rotation_2,rotation_3,rotation_4]
  end
end
