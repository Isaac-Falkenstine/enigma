require './lib/enigma'
require './lib/rotation'
require 'date'
require 'pry'

enigma = Enigma.new

key = rand(10000..99999)

encrypted_file = File.open(ARGV[1], "w")
message = File.open(ARGV[0], "r")
message_string = message.read.strip

encrypted_text = enigma.encrypt(message_string, key)
encrypted_file.write(encrypted_text)
encrypted_file.close

p "Created 'encrypted.txt' with the key #{key} and date #{date = Time.now.strftime("%d%m%y")}"
