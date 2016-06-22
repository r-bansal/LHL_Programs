def cost(dimensions, colors)
  dcost = dimensions*15
  if colors <= 2
    ccost = 10*colors
  else
    ccost = 15*colors
  end
  return (totalcost = (dcost+ccost)*1.15).round(2)
end

puts cost(33,10)
