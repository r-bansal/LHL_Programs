class Unit
  attr_reader :health_points, :attack_power, :unit_type
  def initialize(health,attack,unit = "Foot")
    @health_points = health
    @attack_power = attack_power
    @unit_type = unit
  end

  def damage(attack_power)
    @health_points -= attack_power unless (dead?)
  end

  def attack!(enemy)
    return if (@unit_type == "Seige" && enemy.unit_type == "Foot")
    enemy.damage(@attack_power) unless (dead?)
  end

  def dead?
    @health_points == 0
  end

end
