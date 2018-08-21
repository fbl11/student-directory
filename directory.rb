# Exercise 5
# Our code only works with the student name and cohort. Add more information:
# hobbies, country of birth, height, etc.

def input_students
  students = []
  name = "placeholder"

  while !name.empty? do
    puts 'Please enter the name of the student'
    puts 'To finish, just hit return'
    name = gets.chomp.capitalize

    break if name.empty? == true

    # not used until Exercise 7
    # puts 'Please enter the student cohort'
    # cohort = gets.chomp.to_sym
    
    puts 'Please enter the student\'s hobby'
    hobby = gets.chomp.capitalize

    puts 'Please enter the student\'s hight (in cm)'
    height = gets.chomp
    
    students << {name: name, cohort: :november, hobby: hobby, height: height}
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
      puts "Hobby: #{student[:hobby]}"
      puts "Height: #{student[:height]}\n\n"
    end
end

def print_footer(number_of)
    puts "Overall, we have #{number_of.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)