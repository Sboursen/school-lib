$LOAD_PATH << '.'
require 'person'

class Teacher < Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end
