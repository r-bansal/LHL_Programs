@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan'
}

@states[:LA] = "Los Angeles"
@states[:IDK] = "I Don't Know"

@cities = {
  OR: ['Medford','Bend'],
  FL: ['Orlando','Tampa']
}

@taxes = {
  OR: 7.5,
  FL: 10
}

def describe_state(state_code)
  cities_list =[]
  puts "#{state_code} is for #{@states[state_code.to_sym]}. It has #{@cities[state_code.to_sym].length} major cities: #{@cities[state_code.to_sym].join(', ')}"
end

describe_state("OR")

def calculate_tax(state_code, money)
  ((@taxes[state_code.to_sym]/100)+1)*money
end

puts calculate_tax("OR",200)

def find_state_for_city(city_name)
  #for each state in @states, check their cities in the variable @cities
  @cities.each do |statecode, cityname|
    if @cities[statecode].include?(city_name)
      puts "Your city is located in the state of #{@cities.key(cityname)}"
    end
  end
end

puts find_state_for_city('Orlando')
