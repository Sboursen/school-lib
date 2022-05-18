require_relative '../person'
require_relative '../rental'
require_relative '../book'
require_relative '../classroom'

describe Student do
  context 'Given age and name' do
    it 'creates a new student with the correct parameters' do
      age = 17
      name = 'Jeff'
      student = Student.new(age, name)

      expect(student.age).to equal(age)
      expect(student.name).to eql(name)
      expect(student.id).to be_between(1, 1000)
      expect(student.rentals).to be_empty
      expect(student.classroom).to be_instance_of(Classroom)
    end
  end

  before :each do
    @student = Student.new(17, 'Jeff')
  end

  context 'Given a Classroom' do
    it 'updates the classroom of student' do
      classroom = Classroom.new('new-classroom')
      @student.classroom = classroom

      expect(@student.classroom).to equal(classroom)
    end
  end

  context 'Given a Student' do
    it 'ask person to play hookey' do
      expect(@student.play_hooky).to eql("¯\(ツ)/¯")
    end
  end

  context 'Given a Student' do
    it 'generate a hash representation from it' do
      hash = @student.to_hash

      expect(hash[:class]).to eql(@student.class)
      expect(hash[:age]).to eql(@student.age)
      expect(hash[:name]).to eql(@student.name)
      expect(hash[:id]).to eql(@student.id)
    end
  end

  context 'Given a hash representation' do
    it 'generate a Student object from it' do
      hash = { 'class' => 'Student', 'age' => 17, 'name' => 'Jeff', 'parent_permission' => true, 'id' => 897 }
      student = Student.create_from_hash(hash)

      expect(student.name).to equal(hash['name'])
      expect(student.age).to equal(hash['age'])
      expect(student.id).to equal(hash['id'])
      expect(student.rentals).to be_empty
    end
  end
end
