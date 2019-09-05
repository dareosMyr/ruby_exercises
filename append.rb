def append(arr, n)
	return arr.push(0) if n == 0
	return append(arr.push(n), n - 1)
end

#print append([], 10)

def reverse_append(arr, n)
	return arr if n < 0
	reverse_append(arr, n - 1)
	arr.push(n)
	arr
end

#print reverse_append([], 9)


def sum_upto(n)
	return 1 if n == 1
	return sum_upto(n - 1) + n
end

#puts sum_upto(100)

def fac(n)
	return 1 if n == 0
	n * fac(n - 1)
end

#puts fac(3)

def pal(string)
	if string.length == 1 || string.length == 0
		true
	else
		if string[0] == string[-1]
			pal(string[1..-2])
		else
			false
		end
	end
end

#puts pal("poo")

def beer(n)
	return "No more bottles..." if n == 0
	puts "#{n} more bottles..."
	beer(n-1)
end

#puts beer(10)


def fib(n)
	return 0 if n == 0
	return 1 if n == 1
	return fib(n-1) + fib(n-2)
end

#puts fib(10)

# 0, 1, 1, 2, 3, 5, 8, 13

def flatten(arr)
	return 
	flatten(arr[0]) + flatten(arr[0 + 1])
end

#print flatten([[1, 2], [3, 4], [5, 6]])

def merge_sort(arr)
	return arr if arr.length < 2
	left = arr.slice(0...arr.length/2)
	right = arr.slice(arr.length/2..-1)
	merge_sort(left)
	merge_sort(right)
	r = l = k = 0
	while l < left.length && r < right.length do
		if left[l] > right[r]
			arr[k] = right[r]
			r += 1
		else
			arr[k] = left[l]
			l += 1
		end
		k += 1
	end
	while l < left.length do
		arr[k] = left[l]
		l += 1
		k += 1
	end
	while r < right.length do
		arr[k] = right[r]
		r += 1
		k += 1
	end
	arr
end

#print merge_sort([5, 12, 3, 7, 4, 1, 6, 10, 50, 30, 2]) #cheated by using while

def merge_sort2(arr)
	return arr if arr.length < 2
	left = arr.slice(0...arr.length/2)
	right = arr.slice(arr.length/2..arr.length)
	print merge_sort2(left)
	print merge_sort2(right)
	#merge(merge_sort(left),merge_sort(right),arr)
end

def merge(left,right,i=0,l=0,r=0,arr)
	return arr if l == left.length && r == right.length
	if right[r] == nil
		arr[i] = left[l]
		l += 1
		i += 1
		return merge(left, right, i, l, r, arr)
	elsif left[l] == nil
		arr[i] = right[r]
		r += 1
		i += 1
		return merge(left, right, i, l, r, arr)
	end
	if left[l] > right[r]
		arr[i] = right[r]
		r += 1
	else
		arr[i] = left[l]
		l += 1
	end
	i += 1
	merge(left, right, i, l, r, arr)
end

#print merge_sort2([3, 12, 5, 7, 4, 8, 15, 10, 13, 2])
print merge_sort2([5, 12, 3, 7, 4, 1, 6, 10, 50, 30, 2, 40, 130, 9, 100, 99])