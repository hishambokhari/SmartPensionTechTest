require_relative 'catalog'

def results(result)
  puts "Total Visits:"
  results.each {|key, value| puts "#{key} and #{value} visits in total"}
end