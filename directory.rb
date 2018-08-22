# Exercise9
# Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student".
# How can you fix it so that it used singular form when appropriate and plural form otherwise?

# students = [
#     {name: 'Dr. Hannibal Lecter', cohort: :august},
#     {name: 'Darth Vader', cohort: :november},
#     {name: 'Nurse Ratched', cohort: :august},
#     {name: 'Michael Corleone', cohort: :november},
#     {name: 'Alex DeLarge', cohort: :april},
#     {name: 'The Wicked Witch of the West', cohort: :november},
#     {name: 'Terminator', cohort: :november},
#     {name: 'Freddy Krueger', cohort: :november},
#     {name: 'The Joker', cohort: :november},
#     {name: 'Joffrey Baratheon', cohort: :april},
#     {name: 'Norman Bates', cohort: :november}
# ]

def input_students
  students = []
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.chomp
  
  while !name.empty? do
    students << {name: name, cohort: :november}
# How can you fix it so that it used singular form when appropriate and plural form otherwise?
    students.length == 1 ? (puts "Now we have #{students.count} student")
    : (puts "Now we have #{students.count} students")
    name = gets.chomp
  end
  students
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------' 
end

def print_names(names)
    names.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(number_of)
    puts "Overall, we have #{number_of.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)