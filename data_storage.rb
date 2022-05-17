require 'json_handler'
require 'student'
require 'teacher'
require 'book'
require 'rental'

class DataStorage
  def initialize(file_name)
    @file_name = file_name
  end

  def read_data
    JsonHandler.parse_json(File.read(@file_name)) if File.exist?(@file_name) # [{}, {}, {}]
  end

  def objects_from_array(array_of_hashes)
    array_of_hashes.map do |hash|
      class_name = hash[:class]
      if class_name == 'Student'
        Student.create_from_hash(hash)
      elsif class_name == 'Teacher'
        Teacher.create_from_hash(hash)
      elsif class_name == 'Book'
        Book.create_from_hash(hash)
      end
    end
  end

  def rentals_from_array(array_of_rentals, books, people)
    # todo
    array_of_rentals.map do |hash|
      person = people.find { |p| hash[:person_id] == p.id }
      book = books.find { |b| hash[:book_id] == b.id }
      Rental.new(hash[:date], person, book)
    end
  end

  def write_data(data)
    File.write(@file_name, JsonHandler.generate_json(data))
  end
end
