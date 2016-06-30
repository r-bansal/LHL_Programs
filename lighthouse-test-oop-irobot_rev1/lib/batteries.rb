class Batteries < Item
  def initialize
    super("Battery",25)
  end

  def recharge(robot)
    robot.shields = 50
  end
end


# bundle exec rspec spec/16_implement_batteries.rb
# bundle exec rspec spec/15_introduce_shields.rb
