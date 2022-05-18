require_relative '../student'
require_relative '../classroom'


describe Classroom do
  context "Given a label" do
    it "creates a new classroom with the correct parameters" do
      label = 'my classroom'

      classroom = Classroom.new(label)

      expect(classroom.label).to eql(label)
      expect(classroom.students).to be_empty
    end
  end

  before :each do
    @classroom = Classroom.new('my classroom')
  end

  context "given a student object" do
    it "adds the student object to the students list " do
      student = Student.new(18)

      @classroom.add_student(student)

      expect(@classroom.students).to_not be_empty
      expect(@classroom.students.first).to equal(student)
      expect(@classroom.students.first.classroom).to equal(@classroom)
    end
  end

  context "given a multiple student objects" do
    it "adds the student objects to the students list " do
      student1 = Student.new(18)
      student2 = Student.new(18)
      student3 = Student.new(18)

      @classroom.add_student(student1)
      @classroom.add_student(student2)
      @classroom.add_student(student3)

      expect(@classroom.students).to_not be_empty
      expect(@classroom.students.first).to equal(student1)
      expect(@classroom.students[1]).to equal(student2)
      expect(@classroom.students.last).to equal(student3)
      expect(@classroom.students.first.classroom).to equal(@classroom)
      expect(@classroom.students[1].classroom).to equal(@classroom)
      expect(@classroom.students.last.classroom).to equal(@classroom)
    end
  end

 
end
