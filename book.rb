class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
    rental.book = self
  end

  def to_hash
    hash = {}
    hash[:class] = self.class
    hash[:title] = @title
    hash[:author] = @author
    hash
  end

  def self.create_from_hash(hash)
    Book.new(hash['title'], hash['author'])
  end
end
