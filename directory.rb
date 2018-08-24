# shared variables
@students = []
@name = "placeholder"
@cohort = :default_month
@age = 0
@sorted_by_cohort = []

# saving and loading
def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename = 'students.csv') # takes file name as an argument, providing a default name if none is given
  file = File.open(filename, 'r') # opens file with name from argument (default or provided by user)
  file.readlines.each do |line|
    @name, @cohort, @age = line.chop.split(',')
    create_student_list
  end
  file.close
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

# user display
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts '1. Input students'
  puts '2. Show students'
  puts '3. Save students to students.csv'
  puts '4. Load students from students.csv'
  puts '9. Exit'
end

def print_header
  if @students.length > 0 
    puts 'The students of Villains Academy'
    puts '-------------' 
  end
end

def print_footer
    @students.length == 1 ?
    (puts "Overall, we have #{@students.count} great student\n\n")
    : (puts "Overall, we have #{@students.count} great students\n\n")
end

def print_students_list
  if @students.length > 2
    sort_students_by_cohort
  end
  @students.length > 2 ? 
  @print_body.call(@sorted_by_cohort)
  : @print_body.call(@students)
  
end

def print_current_number
  @students.length == 1 ?
  (puts "Now we have #{@students.count} student\n\n")
  : (puts "Now we have #{@students.count} students\n\n")
end

def show_students
  print_header
  print_students_list
  print_footer
end

# actions
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

def create_student_list
  @students << {name: @name, cohort: @cohort.to_sym, age: @age}
end

@print_body = -> (list) { list.each.with_index { |student, index| puts "#{index + 1}. #{student[:name]}, age: #{student[:age]} (#{student[:cohort]} cohort)" }}

def input_students
  while !@name.empty? do
    puts 'Please enter the name of the student'
    puts 'To finish, just hit return'
    @name = STDIN.gets.chomp.capitalize

    break if @name.empty?

    loop do
      puts 'Please enter the student cohort'
      @cohort = STDIN.gets.chomp.downcase.to_sym
        if @cohort.empty?
          @cohort = :default_month
        end
      break if validate_cohort(@cohort) == :valid
    end
   
    loop do
      puts 'Please enter the student\'s age'
      @age = STDIN.gets.chomp

    break if validate_age(@age) == :valid
    end
   
    create_student_list
    print_current_number
  end
    @students
end

def sort_students_by_cohort
  cohort_values = @students.map {|student_entry| student_entry.values[1]}.uniq

  cohort_values.each do |month|
    @students.each.with_index do |student, index|
      if student[:cohort] == month
        @sorted_by_cohort << {name: student[:name], age: student[:age], cohort: student[:cohort]}
      end 
    end
  end
end

# validation
def validate_cohort(month)
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december, :default_month]
  
  !(months.include?(month)) ? :invalid : :valid
end

def validate_age(number)
  (number.to_r > 0 && number.to_r <= 150) ? :valid : :invalid
end

try_load_students
interactive_menu