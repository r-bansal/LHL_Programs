def mergesort(arr)
  return arr if arr.length <= 1
  l1 = arr[0,((arr.length)/2)]
  l2 = arr[(((arr.length)/2)+1),arr.length-1]

  l1 = mergesort(l1)
  l2 = mergesort(l2)
  return merge(l1,l2)
end

def merge(a1,b1)
  c = []
  while (a1.length >=1) && (b1.length >=1)
    #puts a1[0]
    #puts b1[0]
    if (a1[0] > b1[0])
      c << b1.shift
    else
      c << a1.shift
    end
  end

  while a1.length >= 1
    c << a1.shift
  end

  while b1.length >= 1
    c << b1.shift
  end

  return c
end


puts mergesort([10,9,4,1,3,20])

=begin
while a1.length >= 1
  c << a1[0]
  a1.delete(1)
end

while b1.length >= 1
  c << b1[0]
  b1.delete(1)
end
=end
