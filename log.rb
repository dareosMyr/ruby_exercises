$depth = 0
$space = ' '
def log description, &proc
    puts $space*$depth + 'Starting ' + description + '...'
    $depth = $depth + 1
    proc.call
    $depth = $depth - 1
    puts $space*$depth + 'Finished ' + description + '! Returned: ' + @x.to_s
end

log 'Grandfather Clock' do
    @current_time = Time.new.hour
    if @current_time == 0
        @current_time = @current_time + 12
    elsif @current_time > 12 
        @current_time = @current_time - 12
    end
    @current_time.times do
        puts "DONG!"
        @x = @current_time
    end
end

log 'What\'s up?' do
    @x = 'not much...'
    log 'I\'m bored' do
        5.times do
            puts 'BORED!!'
        end
    end
    log 'test' do
        puts 'Initializing dildonator...'
        @x = 'Ready to pound!'
    end
end