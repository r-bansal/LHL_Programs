require_relative 'spec_helper'

describe Unit do
  before :each do
    @unit = Unit.new(100,5)
    @unit2 = Unit.new(100,5)
    @unit.damage(100)
  end

  

  # describe "#"

  describe "#dead" do
    it "dies if it has 0 hp" do
      expect(@unit.dead?).to eq(true)
    end
  end

  describe "#damage_test" do
    it "won't hurt the unit when dead" do
      expect(@unit.damage(@unit2.attack_power)).to be_nil
    end
  end

  describe "#attack_test" do
    it "can't hurt other units when dead" do
      expect(@unit.attack!(@unit2)).to be_nil
    end
  end

end
