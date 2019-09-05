class Die
    def initialize
        roll
    end

    def roll
        @numberShowing = 1 + rand(6)
    end

    def showing
        @numberShowing
    end

    def set number
        if number <= 6
            @numberShowing = number
        else 
            puts 'Number must be no higher than 6'
        end
    end
end
puts Die.new.showing