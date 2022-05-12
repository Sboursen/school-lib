$LOAD_PATH << '.'
require 'classroom'
require 'person'
require 'teacher'
require 'student'
require 'book'
require 'rental'

class App
  def initialize
    puts 'Welcome to School Library App!'
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
end

def main
  app = App.new
  app.print_prompt
end

main
