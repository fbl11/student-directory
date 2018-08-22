# Exercise8

students = [
    {name: 'Dr. Hannibal Lecter', cohort: :august},
    {name: 'Darth Vader', cohort: :november},
    {name: 'Nurse Ratched', cohort: :august},
    {name: 'Michael Corleone', cohort: :november},
    {name: 'Alex DeLarge', cohort: :april},
    {name: 'The Wicked Witch of the West', cohort: :november},
    {name: 'Terminator', cohort: :november},
    {name: 'Freddy Krueger', cohort: :november},
    {name: 'The Joker', cohort: :november},
    {name: 'Joffrey Baratheon', cohort: :april},
    {name: 'Norman Bates', cohort: :november}
]
# not used for this exercise
# def input_students
#   students = []
#   puts 'Please enter the names of the students'
#   puts 'To finish, just hit return twice'
#   name = gets.chomp
  
#   while !name.empty? do
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     name = gets.chomp
#   end
#   students
# end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------' 
end

# change the way the users are displayed: print them grouped by cohorts. 
def print_names(names)
# collects all unique existing cohort values
  cohort_values = names.map {|student_entry| student_entry.values[1]}.uniq
  puts cohort_values

# iterates over all unique months collected in 'cohort_values'
  cohort_values.each do |month|
# iterates over all students recorded in 'students' array
    names.each do |student|
# compares current cohort_value to current student's cohort value and if equal puts full student entry
      if student[:cohort] == month
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end 
    end
  end
  
end

def print_footer(number_of)
  puts "Overall, we have #{number_of.count} great students"
end

print_header
print_names(students)
print_footer(students)