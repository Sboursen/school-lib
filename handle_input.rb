require 'display_message'

module HandleInput
  def self.read_name
    print 'Name: '
    name = gets.chomp
    name.empty? ? read_name : name
  end

  def self.read_age
    print 'Age: '
    age = gets.chomp.to_i
    in_array?(age, (1..1000)) ? age : read_age
  end

  def self.read_title
    print 'Title: '
    title = gets.chomp
    title.empty? ? read_title : title
  end

  def self.read_author
    print 'Author: '
    author = gets.chomp
    author.empty? ? read_author : author
  end

  def read_desired_date
    print "\nDate: "
    gets.chomp
  end

  def self.read_permission
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    in_array?(permission.capitalize, %w[Y N]) ? permission.capitalize : read_permission
  end

  def self.read_specialization
    print 'Specialization: '
    specialization = gets.chomp
    specialization.empty? ? read_specialization : specialization
  end

  def self.in_array?(user_input, arr)
    result = arr.include?(user_input)
    DisplayMessage.invalid_input_message(user_input) unless result
    result
  end
end
