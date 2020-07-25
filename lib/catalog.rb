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

  def fill_pages
    pages = []
    parse.each {|page| pages << page[0]}
    pages.sort!
    if pages.empty?
      raise("Error: Log file is empty")
    else
      return pages
    end
  end

  def hash
    hash_data = Hash.new(){|hs, key| hs[key] = []}
    parse.each{|key, value| hash[key] << value}
    return hash
  end

end