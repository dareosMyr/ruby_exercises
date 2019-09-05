class OrangeTree
    def initialize
        @height = 2
        @oranges = 0
        @age = 0
        puts 'You planted a little orange tree! It stands ' + @height.to_s + ' feet tall and bears no fruit.'
    end

    def oneYearPasses
        @age = @age + 1 
        if @age == 10
            puts 'Your poor tree has died despite your diligent care. It\'s time to plant another!'
            exit
        end
       
        if @height == 30 
            puts 'Wow! Your magnificent tree stands ' + @height.to_s + ' tall! It is the pride of the town!'
        end
        if @oranges > 0
            puts 'The oranges you left on the tree have fallen to the ground. The racoons thank you.'
            @oranges = 0
        end
        if @height < 30 
            @height = @height + rand(4)
            puts 'Your tree is ' + @height.to_s + ' feet tall!'
            if @height > 6 && @height <= 10
                @oranges = @oranges + 2
            elsif @height > 10 && @height <= 15
                @oranges = @oranges + 4
            elsif @height > 15 && @height <= 20
                @oranges = @oranges + 8
            elsif @height > 20
                @oranges = @oranges + 10
            end
        end
    end

    def countTheOranges
        puts 'There are ' + @oranges.to_s + ' oranges on the tree.'
    end

    def pickAnOrange
        if @oranges > 0
            @oranges = @oranges - 1
            puts 'You pull an orange from the tree. It will make some delicious juice!'
        else
            puts 'There are no more oranges on your tree. You will have to wait till next year.'
        end
    end
end

tree = OrangeTree.new
tree.countTheOranges
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.countTheOranges
tree.pickAnOrange
tree.pickAnOrange
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses