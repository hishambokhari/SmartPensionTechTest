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
    parse.each{|key, value| hash_data[key] << value}
    return hash_data
  end

  def fill_hash
    hash_data = Hash.new()
    hash.each do |key, value| #hash is the hash method defined above
      value.uniq!
      hash_data[key] = value.count
    end
    return hash_data.sort_by{|key, value| -value}.to_h
  end

  def page_visits
    hash_data = Hash.new(0)
    hash.each do |key, value|
      hash_data[key] = value.count
    end
    return hash_data.sort_by{|key, value| -value}.to_h
  end

  def visits_on_average
    hash_data = Hash.new()
    hash.each do |key, value|
      hash_data[key] = (value.count + value.uniq.count)/2
    end
    return hash_data.sort_by{|key, value| -value}.to_h
  end

end