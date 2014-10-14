# Encoding: utf-8
require 'csv'

def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year
  tab_film = []
  csv_options = { col_sep: ',', headers: true, encoding:  'UTF-8'}


  CSV.foreach(file_name, csv_options) do |row|
    tab_film << {
      name: row[0],
      year: row[1].to_i,
      earnings: row[2].to_i
    }
  end

  tab_film_temp = []
  tab_film.each do |x|
    tab_film_temp << x if x[:year] < max_year
  end

  tab_film_temp.sort { |el1, el2| el1[:earnings] <=> el2[:earnings]}

  resultat=tab_film_temp[0..(number-1)]


end

p most_successfull(3, 2002, "lib/movies.csv")


