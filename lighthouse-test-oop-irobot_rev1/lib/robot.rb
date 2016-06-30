class Robot
  class RobotAlreadyDeadError < StandardError
  end

  attr_reader :position, :items, :items_weight, :health
  attr_accessor :equipped_weapon
  def initialize(position = [0,0])
    @position = position
    @items = []
    @items_weight = 0
    @health = 100
    @equipped_weapon = nil
  end

  def move_left
    @position[0] -=1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -=1
  end

  def pick_up(new_item)
    # puts "#{@items_weight} beginning #{new_item.weight}"
    if self.health <= 80 && new_item.class == BoxOfBolts
      new_item.feed(self)
    else
      if (@items_weight + new_item.weight) > 250
        return
      else
        @equipped_weapon = new_item if (new_item.class.superclass == Weapon)
        @items_weight += new_item.weight
        @items << new_item
      end
    end
  end

  def wound(damage=5)
    @health -= damage
    @health = 0 if @health - damage <= 0
  end

  def heal!
    raise "Can't heal, already dead"
  end

  def heal(plus_health)
    if @health == 0
      heal!
    else
      @health += plus_health unless @health + plus_health >= 100
    end
  end

  def attack(another_robot)
    raise "Can only attack a robot" if another_robot.class != Robot
    another_robot.wound(5) if @equipped_weapon.nil?
    if (@position[1] - another_robot.position[1]).abs <= @equipped_weapon.range
        @equipped_weapon.hit(another_robot)
        @equipped_weapon = nil if @equipped_weapon.class == Grenade
    end
  end 
end

# require './item.rb'
# require 'pry'
# require './weapon.rb'
# robot = Robot.new
# item = Item.new("bolts", 8)
# robot.wound(100)
# robot.heal(10)
# robot.attack(item)



# bundle exec rspec spec/14_grenade_reach.rb
