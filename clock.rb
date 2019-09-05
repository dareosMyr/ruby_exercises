def clock proc
    current_time = Time.new.hour
    if current_time == 0
        current_time = current_time + 12
    elsif current_time > 12 
        current_time = current_time - 12
    end
    current_time.to_i.times do
        proc.call
    end
end

dong_proc = Proc.new do 
    puts 'DONG!'
end

clock dong_proc