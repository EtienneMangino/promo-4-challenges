class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :name, :city, :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @array_rates = []
    @average_rating
  end

  # TODO: implement #filter_by_city and #rate methods
  def rate(note)
    @array_rates << note
    somme = 0
    @array_rates.each { |x| somme += x }
    @average_rating = somme.to_f / @array_rates.size
  end

  def self.filter_by_city(tab_restos, ville)
    tab_filter = []
    tab_restos.each { |x| tab_filter << x if x.city == ville }
    tab_filter
  end
end
