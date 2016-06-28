class SiegeEngine < Unit

  attr_reader :health_points, :attack_power, :unit_type

  def initialize(health_points = 400, attack_power = 50, unit_type = "Seige")
    @health_points = health_points
    @attack_power = attack_power
    @unit_type = unit_type
  end

  def attack_barrack
    (attack_power*2).ceil
  end



end
