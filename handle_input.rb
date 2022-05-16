require 'display_message'

module HandleInput
  def self.read_name
    print 'Name: '
    get_input(read_name)
  end

  def self.read_age
    print 'Age: '
    age = gets.chomp.to_i
    in_array?(age, (1..1000)) ? age : read_age
  end

  def self.read_title
    print 'Title: '
    get_input(read_title)
  end

  def self.read_author
    print 'Author: '
    get_input(read_author)
  end

  def read_desired_date
    print "\nDate: "
    get_input(read_desired_date)
  end

  def self.read_permission
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    in_array?(permission.capitalize, %w[Y N]) ? permission.capitalize : read_permission
  end

  def self.read_specialization
    print 'Specialization: '
    get_input(read_specialization)
  end

  def self.in_array?(user_input, arr)
    result = arr.include?(user_input)
    DisplayMessage.invalid_input_message(user_input) unless result
    result
  end

  def get_input(recursive_call)
    input = gets.chomp
    input.empty? ? recursive_call : input
  end
end
