class PlasmaCannon < Weapon
  def initialize
    super("Plasma Cannon", 200, 55)
    @range = 1
  end
end


# bundle exec rspec spec/08_plasma_cannons.rb
