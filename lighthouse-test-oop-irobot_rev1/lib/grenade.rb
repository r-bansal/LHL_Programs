class Grenade < Weapon
  attr_reader :name, :weight, :damage, :range
  def initialize
    super("Grenade",40,15)
    @range = 2
  end

end

# bundle exec rspec spec/13_grenades.rb
