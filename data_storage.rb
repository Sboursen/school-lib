require 'json_handler'

class DataStorage
  def initialize(file_name)
    @file_name = file_name
  end

  def read_data
    JsonHandler.parse_json(File.read(@file_name)) if File.exist?(@file_name)
  end

  def write_data(data)
    File.write(@file_name, JsonHandler.generate_json(data))
  end
end
