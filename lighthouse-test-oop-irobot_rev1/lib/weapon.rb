class Weapon < Item
  attr_reader :name, :weight, :damage, :range
  def initialize(name,weight,damage)
    @name = name
    @weight = weight
    @damage = damage
    @range = 1
  end

  def hit(another_robot)
    another_robot.wound(@damage)
  end
end
