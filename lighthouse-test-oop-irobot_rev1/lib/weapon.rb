class Weapon < Item
  attr_reader :name, :weight, :damage
  def initialize(name,weight,damage)
    @name = name
    @weight = weight
    @damage = damage
  end

  def hit(another_robot)
    another_robot.wound(@damage)
  end
end
