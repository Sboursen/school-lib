$LOAD_PATH << '.'
require 'classroom'
require 'person'
require 'teacher'
require 'student'
require 'book'
require 'rental'

class App
  attr_accessor :user_input

  def initialize
    puts 'Welcome to School Library App!'
    print_prompt
    @user_input = gets.chomp
  end

  def print_prompt
    puts '
          1 | List all books
          2 | List all people
          3 | Create a person
          4 | Create a book
          5 | Create a rental
          6 | List all rentals for a given person id
          7 | Exit'
    puts ''
    puts 'Select an option: '
  end

  def user_input_valid?(user_input)
    %w[1 2 3 4 5 6 7].include?(user_input)
  end

  def display_for_user(user_input)
    case user_input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '6'
      list_all_rentals
  end

  def run
    case user_input
    when '1', '2', '6'
      display_for_user(user_input)
    when '3', '4', '5'
      create_for_user
    when '7'
      exit(true)
    else
      puts "\nInvalid input \"#{user_input}\" !"
      puts 'please try with one of these options:'
      print_prompt
      @user_input = gets.chomp
      run
    end
  end
end

def main
  app = App.new
  app.run
end

main
