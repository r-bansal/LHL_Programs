require_relative 'spec_helper'

describe Footman do
  before :each do
    @footman = Footman.new
    @barrack = Barracks.new
  end

  describe "#attack_barrack" do
    it "should hurt the building" do
      @barrack.damaged(@footman)
      expect(@barrack.health_points).to eq(495)
    end
  end
end
