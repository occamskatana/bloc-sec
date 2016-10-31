class RecursiveSearch
	def initialize()	
	end

	def binary_search(n, array)
		return nil if n == nil || array == nil

		low = array[0]
		mid = array[array.length / 2]
		high = array[array.length - 1]

		return mid if mid == n
		return nil if mid == high

		if n > mid
			binary_search(n, array[array.length / 2..array.length - 1])
		else
			binary_search(n, array[0..array.length / 2])
		end
	end
end


class IterativeSearch
	def binary_search(n, array)
		return nil if n == nil || array == nil 
		
		current_array = array 
		
		while current_array[0] <= current_array[current_array.length / 2] do
			low = current_array[0]
			mid = current_array[current_array.length / 2]
			high = current_array[current_array.length - 1]
			return mid if mid == n 
			return nil if mid == high 
			if n > mid 
				current_array = current_array[current_array.length / 2..current_array.length - 1]
			else
				current_array = current_array[0..current_array.length / 2]
			end
		end
	end
end