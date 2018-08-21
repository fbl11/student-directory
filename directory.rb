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

# Exercise 4
# Rewrite the each() method that prints all students using while or until control flow methods (Loops).
def print_names(student_information)
    counter = 0
    
    while counter < student_information.length do
      puts "#{student_information[counter][:name]} (#{student_information[counter][:cohort]} cohort)"
      counter += 1
    end
    
end

def print_footer(number_of)
    puts "Overall, we have #{number_of.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)