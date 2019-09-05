puts 'Enter the year you were born'
year = gets.chomp
puts 'And now the month'
month = gets.chomp
puts 'And the day'
day = gets.chomp

birth = Time.mktime(year, month, day)
current_date = Time.new
age_seconds = current_date - birth
age_years = age_seconds / 31536000

puts 'SPANK!' * age_years.to_i