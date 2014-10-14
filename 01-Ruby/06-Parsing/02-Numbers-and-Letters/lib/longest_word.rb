require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  alphabet = ("A".."Z").to_a
  resultat = []
  grid_size.times { resultat << alphabet.sample }
  resultat
end


def appel_json(attempt)
  api_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}"
  hash = {}
  open(api_url) do |stream|
    hash = JSON.parse(stream.read)
  end
  hash
end

def run_game(attempt, grid, start_time, end_time)
  if (attempt.upcase.split("") - grid).empty? == false
    return { translation: nil, time: (end_time - start_time), score: 0, message: "not in the grid" }
  end
  hash = appel_json(attempt)
  if hash["Error"].nil?
    { translation: hash["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"],
      time: (end_time - start_time), score: (20 - (end_time - start_time)) + attempt.size, message: "well done" }
  else
    { translation: nil, time: (end_time - start_time), score: 0, message: "not an english word" }
  end
end

p generate_grid(8)

# puts "Your word: #{attempt}"
# puts "Time Taken to answer: #{result[:time]}"
# puts "Translation: #{result[:translation]}"
# puts "Your score: #{result[:score]}"
# puts "Message: #{result[:message]}"