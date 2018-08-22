# Exercise 12
# What happens if the user doesn't enter any students? It will try to print an empty list.
# How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?

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

def validate_cohort(month)
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december, :default_month]
  
  if !months.include?(month)
    puts "Invalid value - please enter a month"
    :invalid
  else
    :valid
  end
end

def validate_age(number)
  (number.to_r > 0 && number.to_r <= 150) ? :valid : :invalid
end

def input_students
  students = []
  name = "placeholder"
  cohort = :default_month
  age = 0

  while !name.empty? do
    puts 'Please enter the name of the student'
    puts 'To finish, just hit return'
    name = gets.chomp.capitalize

    break if name.empty?

    loop do
      puts 'Please enter the student cohort'
      cohort = gets.chomp.downcase.to_sym
        if cohort.empty?
          cohort = :default_month
        end
      break if validate_cohort(cohort) == :valid
    end
   
    loop do
      puts 'Please enter the student\'s age'
      age = gets.chomp

    break if validate_age(age) == :valid
end
   
    students << {name: name, cohort: cohort, age: age}
    students.length == 1 ? (puts "Now we have #{students.count} student")
    : (puts "Now we have #{students.count} students\n\n")
  end
    students
end

def print_header(names)
  if names.length >= 1 
    puts 'The students of Villains Academy'
    puts '-------------' 
  end
end

def print_names(names)
  if names.length >= 1
    cohort_values = names.map {|student_entry| student_entry.values[1]}.uniq
    accumulator = 1

    cohort_values.each do |month|
      names.each.with_index do |student, index|
        if student[:cohort] == month
          puts "#{accumulator}. #{student[:name]}, age: #{student[:age]} (#{student[:cohort]} cohort)"
          accumulator += 1
        end 
      end
    end
  end
end

def print_footer(number_of)
    number_of.length == 1 ?
    (puts "Overall, we have #{number_of.count} great student")
    : (puts "Overall, we have #{number_of.count} great students")
end

students = input_students
print_header(students)
print_names(students)
print_footer(students)