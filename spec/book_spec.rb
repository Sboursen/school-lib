require_relative '../book'
require_relative '../rental'
require_relative '../student'

describe Book do
  context "Given title and author" do
    it "creates a new book with the correct parameters" do
      title = 'my book'
      author = 'Soufiane'

      book = Book.new(title, author)

      expect(book.title).to equal(title)
      expect(book.author).to equal(author)
      expect(book.id).to be_between(1, 1000)
      expect(book.rentals).to be_empty
    end
  end

  before :each do
    @book = Book.new('my book', 'Soufiane')
  end

  context "given a rental object" do
    
    it "adds the rental object to the rentals list " do
      student = Student.new(18)
      tmp_book = Book.new('not my book', 'Soufiane')
      rental = Rental.new('18/05/2022', student, tmp_book)

      @book.add_rental(rental)

      expect(@book.rentals).to_not be_empty
      expect(@book.rentals.first).to equal(rental)
    end

    it "adds multiple rental objects to the rentals list" do
      student = Student.new(18)
      tmp_book = Book.new('not my book', 'Soufiane')
      rental1 = Rental.new('18/05/2022', student, tmp_book)
      rental2 = Rental.new('17/05/2022', student, tmp_book)

      @book.add_rental(rental1)
      @book.add_rental(rental2)

      expect(@book.rentals).to_not be_empty
      expect(@book.rentals.first).to equal(rental1)
      expect(@book.rentals.last).to equal(rental2)
      expect(@book.rentals.length).to be(2)
    end
  end

  context "Given a book object" do
    it "generate a hash representation from it" do

      hash = @book.to_hash

      expect(hash['class'.to_sym]).to eql(@book.class)
      expect(hash['title'.to_sym]).to eql(@book.title)
      expect(hash['author'.to_sym]).to eql(@book.author)
      expect(hash['id'.to_sym]).to eql(@book.id)
    end
  end

  context "Given a hash representation" do
    it "generate a book object from it" do
      hash = {'class'=>Book, 'title'=>"my book", 'author'=>"Soufiane", 'id'=>423}

      book = Book.create_from_hash(hash)

      expect(book.title).to equal(hash['title'])
      expect(book.author).to equal(hash['author'])
      expect(book.id).to equal(hash['id'])
      expect(book.rentals).to be_empty
    end
  end
end
