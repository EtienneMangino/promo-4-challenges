require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  "Your score is #{player_score}, bank is #{bank_score} !"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score > 21
    "lose"
  elsif player_score == 21
    "Black Jack! You win"
  elsif player_score <= bank_score
    "lose"
  else
    "You win"
  end
end

def play_game
  # TODO: make the user play from terminal in a while loop that will stop
  #       when the user will not be asking for  a new card
  puts "Card ?"
  answer = gets.chomp
  score = 0
  score_bank = pick_bank_score

  while answer == "y" || answer == "yes"
    score += pick_player_card
    puts state_of_the_game(score, score_bank)
    puts "Card ?"
    answer = gets.chomp
  end

  puts end_game_message(score, score_bank)
end

