class DataStorage
  def initialize(file_name)
    @file_name = file_name
  end

  def read_data
    if File.exist?(@file_name)
      File.read(@file_name).split
    end
  end

  def write_data(data)
    File.write(@file_name, data)
  end
end
