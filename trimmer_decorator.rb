$LOAD_PATH << '.'
require 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.strip
  end
end
