def input_students
  students = []
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.chomp
  
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students".center(40, '*')
    name = gets.chomp
  end
  students
end

# Exercise 6
# Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.
def print_header
  puts 'The students of Villains Academy'.center(40, '*')
  puts '-------------'.center(40) 
end

def print_names(names)
    names.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
end

def print_footer(number_of)
    puts "Overall, we have #{number_of.count} great students".center(40, '*')
end

students = input_students
print_header
print_names(students)
print_footer(students)