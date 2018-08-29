require 'pry'
require './lib/enigma'

enigma = Enigma.new

key = ARGV[2]
date = ARGV[3]

encrypted_file = File.open(ARGV[0], "r")
decrypted_file = File.open(ARGV[1], "w")
encrypted_string = encrypted_file.read.strip

decrypted_text = enigma.decrypt(encrypted_string, key, date)
decrypted_file.write(decrypted_text)
decrypted_file.close

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
# ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
