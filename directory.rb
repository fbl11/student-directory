def input_students
  students = []
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.chomp
  
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------' 
end

def print_names(names)
    names.each.with_index do |student, index|
      # adds number before each student name - Exercise 1
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(number_of)
    puts "Overall, we have #{number_of.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)