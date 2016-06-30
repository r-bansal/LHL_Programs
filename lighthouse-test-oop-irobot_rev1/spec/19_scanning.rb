require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
  end

  describe "#scanning" do
    it "should tell me what is near me" do
      @robot.move_up
      @robot.move_right
      expect(@robot.position).to eq([1,1])
      @robot2.move_up
      expect(@robot2.position).to eq([0,1])
      expect(@robot.scanning).to eq(["Robot near by!!!"])
    end
  end




end
