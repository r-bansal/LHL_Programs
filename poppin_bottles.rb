# def buy(c_spend)
#   bottles = (c_spend/2).round
# end
#
# def recycle(bottle_r)
#     free_from_bottle = bottle_r/2
#     free_from_caps = bottle_r/4
#     y = [free_from_bottle, free_from_caps]
# end
#
# while true
#     puts "How much will you spend?"
#     x = gets.chomp.to_i
#     puts "You bought #{buy(x)} bottles with #{x%2}$ left over. You will get #{recycle(buy(x))[0]} free bottles from bottles and #{recycle(buy(x))[1]} from caps"
#     puts "You will have #{recycle(buy(x))[0]+recycle(buy(x))[1]} bottles and caps left over "
#     break if x == 0
# end

puts "How much will you spend?"
x = gets.chomp.to_i
x = x/2

def calculate(newBottle,totalB, total_ecaps,total_ebottles)
  #initialize

  if totalB == 0
    ecaps,ebottles = newBottle, newBottle
  else
    ecaps = total_ecaps + newBottle
    ebottles = total_ebottles + newBottle
  end

  newBottle = ecaps/4 + ebottles/2
  totalB = totalB + newBottle 

  total_ecaps = ecaps%4
  total_ebottles = ebottles%2

  return totalB if (total_ecaps < 4 && total_ebottles <2 && newBottle == 0)
  calculate(newBottle, totalB,total_ecaps, total_ebottles)
end

puts calculate(x,x,0,0)
