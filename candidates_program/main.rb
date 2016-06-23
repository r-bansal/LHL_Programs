# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pry'
require './candidates'
require './filters'

## Your test code can go here

#binding.pry

#pp qualified_candidates


menu = true
while menu
  puts "What do you want to do?"
  reply = gets.chomp
  reply = reply.split(" ")

  case reply[0]
  when "find"
    puts find(reply[1].to_i)
  when "all"
    pp @candidates
  when "qualified"
    pp qualified_candidates(@candidates)
  when "quit"
    menu = false
  else
    menu = true
  end
end
