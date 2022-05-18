require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Person do
  context 'Given age' do
    it 'creates a new person with the correct parameters' do
      age = 17
      person = Person.new(age)

      expect(person.age).to equal(age)
      expect(person.name).to eql('Unknown')
      expect(person.id).to be_between(1, 1000)
      expect(person.rentals).to be_empty
    end
  end

  before :each do
    @person = Person.new(17, 'Soufiane')
  end

  context 'Given a Person' do
    it "check if a person's age is greater than 18" do
      expect(@person.of_age?).to be_falsey

      @person.age = 19

      expect(@person.of_age?).to be_truthy
    end
  end

  context 'Given a Person' do
    it 'check if the person can use services' do
      expect(@person.can_use_services?).to be_truthy
    end
  end

  context 'Given a Person' do
    it 'check if name is correct' do
      expect(@person.correct_name).to eql(@person.name)
    end
  end

  context 'Given a Rental' do
    it 'adds the rental to rentals array of person' do
      rental = Rental.new('18/02/2021', Person.new(19), Book.new('Harry', 'Potter'))
      @person.add_rental(rental)

      expect(@person.rentals).to_not be_empty
      expect(@person.rentals.first).to equal(rental)
    end
  end
end
