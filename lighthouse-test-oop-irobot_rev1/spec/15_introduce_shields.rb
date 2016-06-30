require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end


  describe "introduce shields" do
    it "should drain its shields first before affecting health" do
      @robot.wound(50)
      expect(@robot.health).to eq(100)
      @robot.wound(10)
      expect(@robot.health).to eq(90)
    end
  end


end
