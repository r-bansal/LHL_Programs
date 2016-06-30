require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end
#
  describe "#list" do
    it "should list out all the robot objects" do
      expect(Robot.list).to eq([@robot,@robot2,@robot3])
    end
  end
end
