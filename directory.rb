# Exercise7
# In the input_students method the cohort value is hard-coded.
# What if the user makes a typo? Answer: Downcase/upcase/capitalize can ensure correct capitalisation
# other typos would need to be checked for case by case.  For cohort, input would be expected to be
# one of twelve months.  Verification could be done via dictionary lookup that compares user input with 
# values in dictionary and sets to closest match (matches first three letters for example)

def input_students
  students = []
  name = "placeholder"

  while name != "exit" do
    puts 'Please enter the name of the student'
    puts 'To finish, type Exit'
    name = gets.chomp.capitalize

    break if name == "Exit"

# How can you ask for both the name and the cohort? 
    puts 'Please enter the student cohort'
# The input will be given to you as a string? How will you convert it to a symbol?
    cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = :default
    end
    
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students\n\n"
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