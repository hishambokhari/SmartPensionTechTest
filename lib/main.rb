require_relative 'catalog'

def final_results(results)
  puts "Total Visits:"
  results.each {|key, value| puts "#{key} had #{value} visits in total"}
end

def unique_results(results)
  puts " "
  puts " "
  puts "Unique Visits:"
  results.each {|key, value| puts "#{key} had #{value} unique visits"}
end

c = Catalog.new('webserver.log')
page_visits = c.page_visits
unique_visits = c.fill_hash

final_results(page_visits)
unique_results(unique_visits)