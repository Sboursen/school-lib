$LOAD_PATH << '.'
require 'classroom'
require 'person'
require 'teacher'
require 'student'
require 'book'
require 'rental'
require 'handle_input'
require 'display_message'
require 'handle_create'

class App
  attr_accessor :user_input

  def initialize
    DisplayMessage.welcome_message
    DisplayMessage.main_message
    @user_input = gets.chomp
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  end

  def list_all_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def read_desired_book
    puts "\nSelect a book from the following list by number"
    HandleInput.handle_input_based_on_list(method(:list_all_books), @books)
  end

  def read_desired_person
    puts "\nSelect a person from the following list by number"
    HandleInput.handle_input_based_on_list(method(:list_all_people), @people)
  end

  def create_rental
    return print 'Please add a book first' if @books.empty?
    return print 'Please add a person first' if @people.empty?

    book = @books[read_desired_book]
    person = @people[read_desired_person]
    date = HandleInput.read_desired_date

    rental = Rental.new(date, person, book)

    @rentals << rental
    DisplayMessage.success_message(rental)
  end

  def create_for_user(user_input)
    case user_input
    when '3'
      @people = HandleCreate.create_person(@people)
    when '4'
      @books = HandleCreate.create_book(@books)
    when '5'
      create_rental
    end
  end

  def list_all_rentals_for_id
    return puts 'Please add a rental first' if @rentals.empty?

    puts "\nSelect a person from the following list by number"
    @people.each do |person|
      puts "ID: #{person.id}, [#{person.class}] Name: #{person.name}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    rental_list = @rentals.select { |rental| rental.person.id == person_id }
    if rental_list.empty?
      puts 'No rentals found for this person.'
    else
      rental_list.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by  #{rental.book.author}"
      end
    end
  end

  def display_for_user(user_input)
    case user_input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '6'
      list_all_rentals_for_id
    end
  end

  def run
    loop do
      case user_input
      when '1', '2', '6'
        display_for_user(user_input)
      when '3', '4', '5'
        create_for_user(user_input)
      when '7'
        puts 'Thank you for using this app!'
        exit(true)
      else
        DisplayMessage.invalid_input_message(user_input)
        DisplayMessage.main_message
        @user_input = gets.chomp
        run
      end
      DisplayMessage.main_message
      @user_input = gets.chomp
    end
  end
end
