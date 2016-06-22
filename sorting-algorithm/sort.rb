# Sort the array from lowest to highest
def sort(arr)
  swapped = true
  x = (arr.length)-2
  while swapped do 
    swapped = false
    (0..x).each do |i|
      temp1 = arr[i]
      temp2 = arr[i+1]
      if temp1 > temp2
        arr[i+1] = temp1
        arr[i] = temp2
        swapped = true
      end
    end
    print arr

  end
end

sort([5,1,10,3,2])

=begin
# Find the maximum
def maximum(arr)
  sort(arr).last
end

def minimum(arr)
  sort(arr).first
end

# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"


# expect it to return nil when empty array is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"

result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"

result = maximum([6])
puts "max of just 6 is: #{result}"
=end
