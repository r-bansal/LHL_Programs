class Unit
  attr_reader :health_points, :attack_points
  def initialize(health,attack)
    @health_points = health
    @attack_points = attack
  end

  def damage(attack_points)
    @health_points -= attack_points
  end

  def attack!(enemy)
    enemy.damage(@attack_points)
  end

end
