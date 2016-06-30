require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @item = Item.new("random", 8)
  end

  describe "#heal!" do
    it "can't heal if dead" do
      @robot.wound(100)
      expect{@robot.heal(10)}.to raise_error(RuntimeError)
    end

    it "can only attack a robot" do
      expect{@robot.attack(@item)}.to raise_error(RuntimeError)
    end

    # it "should not equip the item as a weapon if it's not a weapon (duh!)" do
    #   @robot.pick_up(@non_weapon)
    #   expect(@robot.equipped_weapon).to be_nil
    # end
  end
end
