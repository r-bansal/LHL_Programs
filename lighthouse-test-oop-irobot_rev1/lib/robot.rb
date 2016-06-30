class Robot
  class RobotAlreadyDeadError < StandardError
  end

  attr_reader :position, :items, :items_weight, :health
  attr_accessor :equipped_weapon, :shields
  @@all_robots = []

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = 100
    @equipped_weapon = nil
    @shields = 50
    @@all_robots << self
  end

  def self.list
    @@all_robots
  end

  def self.in_position
    # all_positions = []
    # self.list.each do |x|
    #   all_positions << x.position
    # end
    # all_positions
    self.list.map{|robot|
      robot.position
    }
  end

  # bundle exec rspec spec/17_robot-list.rb
  # bundle exec rspec spec/18_robot_in_position.rb
  # bundle exec rspec spec/*.rb
  # bundle exec rspec spec/19_scanning.rb

  def scanning
    scan = []
    Robot.in_position.map do |x|
      if x[0] == @position[0] && (x[1]-1).abs == @position[1]
        scan << "Robot near by!!!"
      elsif (x[0]-1).abs == @position[0] && x[1] == @position[1]
        scan << "Robot near by!!!" #at [#{x[0]},#{x[1]}]"
      end
    end
    scan
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
    if @shields >= damage
      @shields -= damage
    elsif (damage > @shields)
      @health -= damage - @shields
      @health = 0 if @health - damage <= 0
    end
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
    distance_difference = (@position[1] - another_robot.position[1]).abs
    if @equipped_weapon.nil? && distance_difference <= 1
      another_robot.wound(5)
    elsif @equipped_weapon.nil? && distance_difference > 1
      return
    elsif distance_difference <= @equipped_weapon.range
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
