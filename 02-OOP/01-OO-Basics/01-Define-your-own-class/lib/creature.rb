class Creature
  attr_accessor :beauty
  attr_reader :size
  attr_reader :behavior


  def initialize(size, behavior, beauty)
    @size = size
    @behavior = behavior
    @beauty = beauty
  end
end


chat = Creature.new("petit", "bipolaire", "beau")
chien = Creature.new("moyen", "sympa", "pas mal")

p chien.size

p chat.beauty
chat.beauty = "moche"
p chat.beauty
