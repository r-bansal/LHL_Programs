class Barracks
  attr_reader :gold, :food

  def initialize(gold = 1000, food = 80)
    @gold = gold
    @food = food
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


end
