class Recipe
  attr_reader :name, :description, :id, :tested

  def initialize(name, description, id = 1, rating = nil, time = nil, tested = false)
    @name = name
    @description = description
    @id = id
    @rating = rating
    @time = time
    @tested = tested
  end

  def rating
    @rating ? @rating : "?"
  end

  def time
    @time ? @time : "?"
  end

  def mark_tested
    @tested = true
  end
end