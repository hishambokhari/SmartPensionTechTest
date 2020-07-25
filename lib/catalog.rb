require 'csv' # It's used for exporting & importing data

class Catalog
  def initialize(file_path)
    @file_path = file_path #instance variable
  end

  def parse
    pages_with_coordinates = []
    CSV.foreach(@file_path){|row| pages_with_coordinates << row[0].split(' ')}
    return pages_with_coordinates
  end

end