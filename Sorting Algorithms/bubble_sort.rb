class BubbleSort

	attr_accessor :input_array

	def initialize(arr)
		@input_array = arr
	end

	def bubblesort
		return "Empty Array " if @input_array.empty?
		k = 0
		while(k < @input_array.length)
			flag = 0
		for i in(0..@input_array.length-2)
		    if(@input_array[i] > @input_array[i+1])
				@input_array = swap(i, @input_array)
				flag =1
			end
		end
		break if flag == 0
		k += 1
	   end
		@input_array
	end

	def swap(i, arr)
		arr[i],arr[i+1] = arr[i+1],arr[i]
		return arr
	end
end
arr = [1,2,3,4,5,6,7,8]
arr = [2,7,6,8,1,3,5,4]
bs = BubbleSort.new(arr).bubblesort
p "final sorted array"
p bs