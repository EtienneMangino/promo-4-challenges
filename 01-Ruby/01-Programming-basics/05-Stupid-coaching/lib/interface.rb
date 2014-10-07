require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "Speak to your coach !"
phrase = gets.chomp

while coach_answer(phrase) != ""
  puts coach_answer(phrase)
  phrase = gets.chomp
end
