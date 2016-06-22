@roman = {
  "1"=> "I",
  "2"=> "II",
  "3"=> "III",
  "4"=> "IV",
  "5"=> "V",
  "6"=> "VI",
  "7"=> "VII",
  "8"=> "VIII",
  "9"=> "IX",
  "10"=> "X",
  "20"=> "XX",
  "30"=> "XXX",
  "40"=> "XL",
  "50"=> "L",
  "60"=> "LX",
  "70"=> "LXX",
  "80"=> "LXXX",
  "90"=> "XC",
  "100"=> "C",
  "200"=> "CC",
  "300"=> "CCC",
  "400"=> "CD",
  "500"=> "D",
  "600"=> "DC",
  "700"=> "DCC",
  "800"=> "DCCC",
  "900"=> "CM",
  "1000"=> "M",
  "2000"=> "MM",
  "3000"=> "MMM"
}

def to_roman(num)
    x = 1000
    final_numeral = ''
    while x >= 1
      power = num/x
      num = num % x
      final_numeral << @roman[(power*x).to_s] unless power.zero?
      x /= 10
    end
  final_numeral
end

# Drive code... this should print out trues

puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"

# TODO: what other cases could you add to ensure your to_roman method is working?
