require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.1.2/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.1.2/String.html#method-i-chomp
def addstudent(array)
  puts " add a student !"
  array << gets.chomp
end

students = []
3.times { addstudent(students) }

sort_students = wagon_sort(students)
puts "Congratulations! Your Wagon has #{sort_students.size} students:
#{sort_students[0]}, #{sort_students[1]} and #{sort_students[2] }"

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list

