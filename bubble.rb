class Array
	def swap(index)
		temp = self[index]
		self[index] = self[index + 1]
		self[index + 1] = temp
	end
end



def bubble (numbers)
	swapped = true
	while swapped == true
		swapped = false
		for index in 0..numbers.length - 1
			next if numbers[index + 1] == nil
			if numbers[index] > numbers[index + 1]
				numbers.swap(index)
				swapped = true
			end
		end
	end
	numbers
end

#puts bubble([4,3,78,2,0,2])


def bubble_sort_by(strings)
	swapped = true
	while swapped == true
		swapped = false
		for index in 0..strings.length - 1
			next if strings[index + 1] == nil
			if yield(strings[index],strings[index + 1]) > 0
				strings.swap(index)
				swapped = true
			end
		end
	end
	puts strings
end

bubble_sort_by(["hey","hello","hi","hiya","howdy"]) do |left,right|
   left.length - right.length
end