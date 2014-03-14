class Quicksort
	attr_accessor :input_array

	def initialize(arr)
		@input_array = arr
	end

	def quicksort
		quicksort_recursive(@input_array, 0 , @input_array.length-1)
	end

	def quicksort_recursive(arry, start_idx, end_idx)
		if start_idx < end_idx
			pIndex = partition_array(arry, start_idx, end_idx)
			quicksort_recursive(arry, start_idx, pIndex-1 )
			quicksort_recursive(arry, pIndex + 1 , end_idx)
		end
	end

	def partition_array(arr, start_idx, end_idx)
		#select the pivot to be the last element of the array
		pivot = arr[end_idx]
		pIndex = start_idx
		for i in (start_idx..end_idx-1) #we dont want the pivot to be included in the partition thats we do end_idx-1 and then swap the indices
			if(arr[i] <= pivot)
				swap(arr, i, pIndex)
				pIndex += 1
			end
		end
		swap(arr, pIndex, end_idx)
		return pIndex
	end


	def swap(arry, idx1 , idx2)
	   arry[idx1], arry[idx2] = arry[idx2], arry[idx1]
	end
end

a =[7,2,1,6,8,5,3,4]
qs = Quicksort.new(a).quicksort