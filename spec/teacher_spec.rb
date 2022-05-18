require_relative '../classroom'
require_relative '../teacher'

describe Teacher do
  context 'Given age, name and specialization' do
    it 'creates a new Teacher with the correct parameters' do
      age = 30
      specialization = 'Teaching'
      name = 'Jeff'
      teacher = Teacher.new(age, specialization, name)

      expect(teacher.age).to equal(age)
      expect(teacher.name).to eql(name)
      expect(teacher.id).to be_between(1, 1000)
      expect(teacher.rentals).to be_empty
    end
  end

  before :each do
    @teacher = Teacher.new(17, 'Teaching', 'Jeff')
  end

  context 'Given a Teacher' do
    it 'check if the teacher can use services' do
      expect(@teacher.can_use_services?).to be_truthy
    end
  end

  context 'Given a Teacher' do
    it 'generate a hash representation from it' do
      hash = @teacher.to_hash

      expect(hash[:class]).to eql(@teacher.class)
      expect(hash[:age]).to eql(@teacher.age)
      expect(hash[:name]).to eql(@teacher.name)
      expect(hash[:id]).to eql(@teacher.id)
    end
  end

  context 'Given a hash representation' do
    it 'generate a Teacher object from it' do
      hash = { 'class' => 'Teacher', 'age' => 17, 'name' => 'Jeff', 'specialization' => 'Teaching', 'id' => 897 }
      teacher = Student.create_from_hash(hash)

      expect(teacher.name).to equal(hash['name'])
      expect(teacher.age).to equal(hash['age'])
      expect(teacher.id).to equal(hash['id'])
      expect(teacher.rentals).to be_empty
    end
  end
end
