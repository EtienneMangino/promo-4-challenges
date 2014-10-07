require_relative "compute_name"

# TODO: ask for the first name
# TODO: ask for the middle name
# TODO: ask for the last name
# TODO: Print a greeting to the user with the full name concatenated,
#       something like "Hello, Boris Paillard"
puts "Your first name ?"
fname = gets.chomp

puts "Your middle name ?"
mname = gets.chomp

puts "Your last name ?"
lname = gets.chomp

final = compute_name(fname, mname, lname)
puts final

