def sumsquares(arr)
  arr.each do |x|
    sum += (x*2)
  end
  return sum
end


sumsquares([1,2,3])
