module Flight
  def fly
    puts "I'm a parrot, I'm flying!"
  end
end

class Animal
  attr_accessor :num_legs
  def initialize(num_legs)
    @num_legs = num_legs
  end
end

class Mammal < Animal
  def initalize
    super
  end

  def self.warm_blooded
    puts "is warm blooded"
  end
end


class Bat < Mammal
  def self.screech
    puts "is blind"
  end
end

class Primate < Mammal
  def initialize
    super(4)
  end
end


class Chimpanzee < Primate
  def initialize
    super
  end
end

class Amphibian < Animal
  def initialize
    super(4)
  end
#
# x = Amphibian.new
# puts x.num_legs

  def self.cold_blooded
    puts 'is cold blooded'
  end
end

x = Amphibian.cold_blooded
puts "hi"

class Frog < Amphibian
  attr_reader :number
  def initialize(number_of_flies_eaten)
    super()
    @number = number_of_flies_eaten
  end
end
# substitution principle LSP

class Bird < Animal
  include Flight

  attr_reader :flyable
  def initialize(num_legs, flyable)
    super(num_legs)
    @flyable = flyable
  end
end

class Parrot < Bird
  def initialize(x,y)
    super
  end
end
