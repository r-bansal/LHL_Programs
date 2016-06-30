require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end

  describe "#in_position" do
    it "should list out all the positions" do
      expect(@robot.position).to eq([0,0])
      @robot2.move_up
      @robot2.move_up
      expect(@robot2.position).to eq([0,2])
      @robot3.move_left
      expect(@robot3.position).to eq([-1,0])
      expect(Robot.in_position).to eq([[0,0],[0,2],[-1,0]])
    end
  end
end
