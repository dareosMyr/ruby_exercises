beer = 99
while beer > 0
    puts beer.to_s + ' bottles of beer on the wall...'
    beer = beer - 1
end
if beer == 0 
    puts 'No more bottles of beer on the wall...'
end