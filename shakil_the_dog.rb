# Save this file to your computer so you can run it
# via the command line (Terminal) like so:
#   $ ruby shakil_the_dog.rb
#
# Your method should wait for user input, which corresponds
# to you saying something to your dog (named Shakil).

# You'll probably want to write other methods, but this
# encapsulates the core dog logic
def shakil_the_dog
  condition = false
  loop do
    puts "What do you want to say to doggie?"
    action = gets.chomp
    case action
    when "woof" then puts "WOOF WOOF WOOF"
    when ("shakil stop") then puts "*Enjoy your peace*"
    when "Shakil STOP!" then puts "*Enjoy your peace*"
    when "meow" then puts "woof woof woof woof woof"
    when /treat/ then puts "*No bark*"
    when "go away"
      puts "Dog leaves you alone"
      condition = true
    else puts "Doggie can't understand"
    break if condition == true
    end
  end
end

# Run our method
shakil_the_dog
