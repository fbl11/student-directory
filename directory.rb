def load_students
  saved_students = File.open('students.csv', 'r')
  saved_students.readlines.each do |line|
    name, cohort, age = line.chop.split(',')
    @students << {name: name, cohort: cohort.to_sym, age: age}
  end
  saved_students.close
end

def validate_cohort(month)
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december, :default_month]
  
  !(months.include?(month)) ? :invalid : :valid
end

def validate_age(number)
  (number.to_r > 0 && number.to_r <= 150) ? :valid : :invalid
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts '1. Input students'
  puts '2. Show students'
  puts '3. Save students to students.csv'
  puts '4. Load students from students.csv'
  puts '9. Exit'
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know this option. Please try again."
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

@students = []

def input_students
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
   
    @students << {name: name, cohort: cohort, age: age}
    @students.length == 1 ? (puts "Now we have #{@students.count} student")
    : (puts "Now we have #{@students.count} students\n\n")
  end
    @students
end

def save_students
  saved_students = File.open('students.csv', 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(',')
    saved_students.puts csv_line
  end
  saved_students.close
end

def print_header
  if @students.length >= 1 
    puts 'The students of Villains Academy'
    puts '-------------' 
  end
end

def print_students_list
  if @students.length >= 1
    cohort_values = @students.map {|student_entry| student_entry.values[1]}.uniq
    accumulator = 1

    cohort_values.each do |month|
      @students.each.with_index do |student, index|
        if student[:cohort] == month
          puts "#{accumulator}. #{student[:name]}, age: #{student[:age]} (#{student[:cohort]} cohort)"
          accumulator += 1
        end 
      end
    end
  end
end

def print_footer
    @students == 1 ?
    (puts "Overall, we have #{@students.count} great student")
    : (puts "Overall, we have #{@students.count} great students")
end

interactive_menu