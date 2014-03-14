class SelectionSort
	attr_accessor :input_array

	def initialize(unsorted_array)
	 @input_array = unsorted_array
	end

	def selection_sort(arr= @input_array)
	 	return "Empty Array" if arr.empty?
		return arr if arr.length == 1
		sorted_arr = selection_sort_recursive(arr, 0)
		return sorted_arr
	end

	def selection_sort_recursive(arr, start)
		if(start < arr.length-1)
		  new_arr = swap_elements(arr, start, min_element_pos(arr, start))
		  selection_sort_recursive(new_arr, start + 1)
		else
			return arr
		end
	end

	def min_element_pos(arr, start)
		min_pos = start
		for idx in start..(arr.length-1)
			if(arr[idx] < arr[min_pos])
				min_pos = idx
			end
		end
		return min_pos
	end

	def swap_elements(arr, start, min_pos)
		arr[start], arr[min_pos] = arr[min_pos], arr[start]
		return arr
	end
end


#tests
arr= [34, 17, 23, 35, 45, 9, 1]

ss = SelectionSort.new(arr)
p ss.selection_sort