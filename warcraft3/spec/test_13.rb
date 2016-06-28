require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barrack = Barracks.new
  end

  describe "#train_siege_engine" do
    it "costs 200 gold" do
      @barrack.train_siege_engine
      expect(@barrack.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barrack.train_siege_engine
      expect(@barrack.food).to eq(77) # starts at 80
    end

    it "costs 60 lumber" do
      @barrack.train_siege_engine
      expect(@barrack.lumber).to eq(440) # starts at 80
    end

    it "produces a siege engine unit" do
      siege_engine = @barrack.train_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end
  end

  describe "#can_train_seige?" do
    it "returns true if there are enough resources to train a seige" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple peasants
      expect(@barrack.can_train_siege?).to eq(true)
    end

    it "returns false if there isn't enough food" do
      # Make the barrack believe it only has 4 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barrack).to receive(:food).and_return(2)
      expect(@barrack.can_train_siege?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barrack believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barrack).to receive(:gold).and_return(199)
      expect(@barrack.can_train_siege?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barrack believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barrack).to receive(:lumber).and_return(59)
      expect(@barrack.can_train_siege?).to be_falsey
    end
  end
end

describe Barracks do
  before :each do
    @barrack1 = Barracks.new
    @siege_engine = SiegeEngine.new
  end

  describe "#attack_barrack" do
    it "should hurt the building" do
      @barrack1.damaged(@siege_engine)
      expect(@barrack1.health_points).to eq(400)
    end
  end
end


describe SiegeEngine do
  before :each do
    @siege_engine = SiegeEngine.new
    @siege_engine2 = SiegeEngine.new
    @unit = Unit.new(100,5)
  end
  # describe "attack_other_units" do
  # end

  describe "#attack!" do
    it "should be able to attack other seiges" do
      @siege_engine.attack!(@siege_engine2)
      expect(@siege_engine2.health_points).to eq(350)
    end

    it "shouldn't be able to attack other units" do
      @siege_engine.attack!(@unit)
      expect(@unit.health_points).to eq(100)
    end

  end
end

# describe Unit do
#   before :each do
#     @siege_engine = SiegeEngine.new
#     @unit = Unit.new(100,5)
#   end
#
#   describe "nothing happens against other units" do
#     it "can be attacked by other units" do
#       @siege_engine.damage(@unit.attack_power)
#       expect(@siege_engine.health_points).to eq(395)
#     end
#
#
#   end
# end
