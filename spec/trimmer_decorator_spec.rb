require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  context 'Given Person' do
    it 'get the trimmed name' do
      person = Person.new(17, 'MaximilianUs')
      trimmed_name = TrimmerDecorator.new(person)

      expect(trimmed_name.correct_name).to eql('Maximilian')
    end
  end
end
