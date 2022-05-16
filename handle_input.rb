module HandleInput
  def self.print_prompt
    puts '
          Please choose an option by entering a number:
          1 | List all books
          2 | List all people
          3 | Create a person
          4 | Create a book
          5 | Create a rental
          6 | List all rentals for a given person id
          7 | Exit'
    puts ''
    puts 'Select an option: '
  end

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
    result = unless arr.include?(user_input)
    puts 'Invalid input, try again!' unless result
    result
  end
end
