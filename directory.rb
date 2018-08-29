require 'csv'

class Student

  attr_reader :name, :cohort, :age

  def initialize(name, cohort, age)
    @name = name
    @cohort = cohort
    @age = age
  end

  def description
    "#{name}, age: #{age} (#{cohort} cohort)"
  end

  def csv_data
    [name, cohort, age]
  end

  # def to_s
  #   description
  # end
end

# instance variables
@students = []

# saving and loading

# allow user to pass file name on start of program, using default file if no argument given
def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def load_students(filename = get_filename)
  # each row represents an array made up of the words found in one line of the csv file 
  CSV.foreach(filename) do |row|
    # takes the word at index 0, 1, and 2 of our 'row-array' and passes them as parameters to function
    add_student_to_list(row[0], row[1], row[2])
  end
  puts "\nLoaded #{@students.count} students from #{filename}"
end

def save_students
  filename = get_filename
  
  CSV.open(filename, 'w') do |file|
    @students.each do |student|
      # pushes student information saved in an array to file - needs to be array!
    file << student.csv_data
    end
  end
  puts "Saved #{@students.count} students to #{filename}"
end

def get_filename
  puts "Please enter name for the file.  Return uses students.csv."
  filename = STDIN.gets.chomp.downcase
  filename = 'students.csv' if filename == ''
  filename
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# printing
def print_menu
  puts '1. Input students'
  puts '2. Show students'
  puts '3. Save students'
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

def print_current_number
  @students.length == 1 ?
  (puts "Now we have #{@students.count} student\n\n")
  : (puts "Now we have #{@students.count} students\n\n")
end

def print_body(list)
  list.each.with_index do |student, index|
    puts "#{index + 1}. #{student.description}"
  end
end

def print_confirmation(selection)
  puts "\nYou have selected to #{selection}\n\n"
end

# actions
def process(selection)
  case selection
  when "1"
    print_confirmation("input students")
    input_students
  when "2"
    print_confirmation("show students")
    show_students
  when "3"
    print_confirmation("save students")
    save_students
  when "4"
    print_confirmation("load students")
    load_students
  when "9"
    print_confirmation("exit the program")
    exit
  else
    puts "I don't know this option. Please try again."
  end
end

def input_students
  name = 'init'
  cohort = ''
  age = 0

  while !name.empty? do
    puts 'Please enter the name of the student'
    puts 'To finish, just hit return'
    name = STDIN.gets.chomp.capitalize

    break if name.empty?

    loop do
      puts 'Please enter the student cohort'
      cohort = STDIN.gets.chomp.downcase.to_sym
        if cohort.empty?
          cohort = :default_month
        end
      break if validate_cohort(cohort) == :valid
    end

    loop do
      puts 'Please enter the student\'s age'
      age = STDIN.gets.chomp

    break if validate_age(age) == :valid
    end

    add_student_to_list(name, cohort, age)
    print_current_number
  end
    @students
end

def add_student_to_list(name, cohort=:default_month, age)
  @students << Student.new(name, cohort.to_sym, age)
end

def sort_students_by_cohort
  @students.sort_by do |student|
    student.cohort
  end
end

def show_students
  print_header
  print_body(sort_students_by_cohort)
  print_footer
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


# replaced by methods working with CSV files directly - Ruby library 'csv'

# def load_students(filename = get_filename)
#   open(filename, 'r') do |file|
#     file.readlines.each do |line|
#       name, cohort, age = line.chop.split(',')
#       add_student_to_list(name, cohort, age)
#     end 
#   end
#   puts "Loaded #{@students.count} students from #{filename}"
# end

# def save_students
#   filename = get_filename
#   open(filename, 'w') do |file|
#     @students.each do |student|
#       file.puts student.csv_data
#     end
#   end
#   puts "Saved #{@students.count} students to #{filename}"
# end