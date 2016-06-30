require_relative 'spec_helper'

describe Batteries do
  before :each do
    @robot = Robot.new
    @battery = Batteries.new
  end

  describe "#recharge" do
    it "should recharge the robot's shields" do
      @robot.wound(50)
      @battery.recharge(@robot)
      expect(@robot.shields).to eq(50)
    end
  end


end
