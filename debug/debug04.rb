def char_count(list)
  letters = {}
  list.each do |word|
    word.split('').each { |letter|
      if letters[letter].nil?
        letters[letter] = 1
      else
        letters[letter] += 1
      end
  }
  end
  letters
end

# Why the long face(error)?
# 1. This should return count of each letter in the list
# ex: { "a" => 4, "p" => 3, "l" => 1  ...}

puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])


# 2. What are the improvements you can do to above code?
# script, githighlights
