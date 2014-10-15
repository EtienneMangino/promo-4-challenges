class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age
  attr_reader :fruits
  attr_reader :height
  attr_reader :dead

  def initialize
    @height = 0
    @age = 0
    @fruits = 0
    @dead = false
  end

  def one_year_passes!
    return if @dead
    @age += 1
    @height = size_of_tree
    if rand((@age - 49)..@age) > 50
      @dead = true
    else
      @fruits = number_of_fruits_this_year
    end
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits > 0
  end

  def size_of_tree
    if @age <= 10
      @age
    else
      10
    end
  end

  def dead?
    if @dead
      true
    else
      false
    end
  end

  def number_of_fruits_this_year
    if @age <= 5
      0
    elsif @age <= 10
      100
    elsif @age <= 15
      200
    else
      0
    end
  end
end
