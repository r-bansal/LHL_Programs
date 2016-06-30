class BoxOfBolts < Item
  attr_reader :name, :weight
  def initialize
    @name = "Box of bolts"
    @weight = 25
    @heal = 20
  end

  def feed(robot_to_heal)
    robot_to_heal.heal(@heal) #not sure about heal
  end


end
