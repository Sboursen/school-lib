require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do
  context 'Given a date, a person and a book' do
    it 'creates a new rental with the correct parameters' do
      person = Student.new(18)
      book = Book.new('My book', 'Author')
      date = '18/05/2022'

      rental = Rental.new(date, person, book)

      expect(rental.date).to eql(date)
      expect(rental.person).to eql(person)
      expect(rental.book).to eql(book)
    end
  end

  before :each do
    person = Student.new(18)
    book = Book.new('My book', 'Author')
    date = '18/05/2022'

    @rental = Rental.new(date, person, book)
  end

  context 'given a student object' do
    it 'assigns the student object to the rental correctly ' do
      new_person = Student.new(19)

      @rental.person = new_person

      expect(@rental.person).to eql(new_person)
      expect(@rental.person.rentals.include?(@rental)).to be_truthy
    end
  end

  context 'given a book object' do
    it 'assigns the book object to the rental correctly ' do
      new_book = Book.new('Not my book', 'Not Me')

      @rental.book = new_book

      expect(@rental.book).to eql(new_book)
      expect(@rental.book.rentals.include?(@rental)).to be_truthy
    end
  end

  context 'Given a rental object' do
    it 'generate a hash representation from it' do
      hash = @rental.to_hash

      expect(hash[:date]).to eql(@rental.date)
      expect(hash[:person_id]).to eql(@rental.person.id)
      expect(hash[:book_id]).to eql(@rental.book.id)
    end
  end
end
