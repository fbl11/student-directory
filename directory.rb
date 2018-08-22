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
  
  !(months.include?(month)) ? :invalid : :valid
end

def validate_age(number)
  (number.to_r > 0 && number.to_r <= 150) ? :valid : :invalid
end

def interactive_menu
  students = []
  
  loop do
    # 1. print the menu and ask the user what to do
    puts 'What would you like to do?'
    puts '1. Input students'
    puts '2. Show students'
    puts '9. Exit'
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students # input the students
    when "2"
      print_header(students)# show students
      print_names(students)
      print_footer(students)
    when "9"
      exit # terminates programme
    else
      puts 'I do not know what you mean, please try again'
    end
  end
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

interactive_menu