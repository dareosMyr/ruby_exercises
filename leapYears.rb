puts 'Enter starting year'
first_year = gets.chomp
puts 'Enter ending year'
end_year = gets.chomp
current_year = first_year.to_i
if first_year.to_i > end_year.to_i
    puts 'Second year must be greater.'
end
while current_year <= end_year.to_i
    if current_year % 4 == 0 && current_year % 100 != 0 || current_year % 400 == 0
        puts current_year
        current_year = current_year + 1 
    else 
        current_year = current_year + 1
    end
end
