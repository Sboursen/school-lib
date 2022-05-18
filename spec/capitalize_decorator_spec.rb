require_relative '../nameable'
require_relative '../person'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  context 'Given a nameable' do
    it 'creates a CapitalizeDecorator with the correct parameters' do
      nameable = Nameable.new

      capitalize_decorator = CapitalizeDecorator.new(nameable)

      expect(capitalize_decorator.nameable).to equal(nameable)
    end

    it 'can write a new nameable to the @nameable field' do
      nameable = Nameable.new
      new_nameable = Nameable.new

      capitalize_decorator = CapitalizeDecorator.new(nameable)
      capitalize_decorator.nameable = new_nameable

      expect(capitalize_decorator.nameable).to equal(new_nameable)
    end
  end

  context 'Given a person' do
    it 'return a the name of the person capitalized ' do
      person = Person.new(13, 'tarik')

      capitalize_decorator = CapitalizeDecorator.new(person)

      expect(capitalize_decorator.correct_name).to eql(person.name.capitalize)
    end
  end
end
