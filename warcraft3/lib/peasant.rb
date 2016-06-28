class Peasant < Unit
  attr_reader :health_points, :attack_power
  def initialize(health_points = 35, attack_power = 0)
    @health_points = health_points
    @attack_power = attack_power
  end

end
