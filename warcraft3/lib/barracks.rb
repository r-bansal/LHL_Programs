class Barracks
  attr_reader :gold, :food, :health_points, :lumber

  def initialize(health_points = 500, gold = 1000, food = 80, lumber = 500)
    @health_points = health_points
    @gold = gold
    @food = food
    @lumber = lumber
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def can_train_footman?
    self.food > 1 && self.gold > 134
    # return true if (@gold > 134 && @food > 1)
    # return false if @food < 2
    # return false if @gold <135
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_train_peasant?
    self.food >= 5 && self.gold >= 90
  end

  def train_siege_engine
    # if can_train_seige?
    @gold -= 200
    @food -= 3
    @lumber -= 60
    SiegeEngine.new
    # end
  end

  def can_train_siege?
    self.food >= 3 && self.gold >= 200 && self.lumber >= 60
  end

  def damaged(attacking_unit)
    @health_points -= attacking_unit.attack_barrack
  end

end
