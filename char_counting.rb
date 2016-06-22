def count_letters(string)
  letters = {}
  string.split('').each_with_index { |item,index|
    if letters[item].nil?
      letters[item] = ([] << index)
    else
      letters[item] << index
    end
  }
  letters
end

puts count_letters("random string hahaha")
