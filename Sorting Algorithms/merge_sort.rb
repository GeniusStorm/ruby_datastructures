class MergeSort
   attr_accessor :input_array

  def initialize(arry)
  	@input_array = arry
  end


  def mergesort
  	#parttion the arry in a probable center
  	 mergesort_recursive(@input_array)
  end

  def mergesort_recursive(arr)
  	return if arr.length < 2
  	pIndex  = (arr.length/ 2).round #split the arry in 2 halves

  	#create a left and right array based on the partion index
  	leftArray = []
  	rightArray = []

    for lindex in (0..(pIndex-1)) do
    	leftArray << arr[lindex]
    end

    for rindex in (pIndex..(arr.length-1)) do
    	rightArray << arr[rindex]
    end


    mergesort_recursive(leftArray)
    mergesort_recursive(rightArray)
    merge(leftArray, rightArray, arr)
    return arr
  end

  def merge(leftarr, rightarr, arr)
  	#need to run three loops , one for leftarr, one for right and one for the main array
  	li = 0 
  	ri = 0
  	mi = 0
  	while(li < leftarr.length && ri < rightarr.length) do
  		if(leftarr[li] <= rightarr[ri])
  			arr[mi] = leftarr[li]
  			li += 1
  		else
  			arr[mi] = rightarr[ri] 
  			ri += 1
  		end
  		mi +=1
  	end


  	while(li < leftarr.length)
  		arr[mi] = leftarr[li]
  		li += 1
  		mi +=1
  	end

  	while(ri < rightarr.length)
  		arr[mi] = rightarr[ri]	
  		ri += 1
  		mi +=1
  	end
  end
end


a=[4,2,5,8,6,3,7,1]

ms = MergeSort.new(a)
ms.mergesort