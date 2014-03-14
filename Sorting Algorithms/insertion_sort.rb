class InsertionSort

	attr_accessor :input_array

	def initialize(input_array)
		@input_array = input_array
	end

	def insertion_sort
		for idx in (1 .. @input_array.length-1)
			tmp = @input_array[idx]
			while (i > 0 && @input_array[i- 1] > tmp) do
				@input_array[i] = @input_array[i-1]
				i = i-1
			end
			@input_array[i] = tmp
		end
		# return @input_array
	end
end

arr = [23, 15, 45, 7,13,3, 1]
is = InsertionSort.new(arr)
