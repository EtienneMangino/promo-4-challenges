require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "Speak to your coach !"
sentence = gets.chomp

while coach_answer_enhanced(sentence) != ""
  puts coach_answer_enhanced(sentence)
  sentence = gets.chomp
end
