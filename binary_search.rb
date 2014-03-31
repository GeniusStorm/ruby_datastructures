#Function takes 2 inputs - Sorted Array and the Target that you want to search within the array
#The output will be the position at which the element is found

def binary_search(arry, target)
  return "Empty Array" if arry.size < 1
  lower_limit = 0
  upper_limit = arry.size - 1
  search_string = binary_search_with_limits(arry, target, lower_limit, upper_limit)
end

def binary_search_with_limits(arry, target, lower_limit, upper_limit)
 range = upper_limit - lower_limit
 return "Limits reversed" if(range < 0)
 return "Target Not found" if(range == 0 && arry[lower_limit] != target)
 return "Unsorted Array" if(arry[lower_limit] > arry[upper_limit])
 centre_elem = arry[(range/2) + lower_limit]
 return("element #{target} found at position #{arry.index(target)}") if(centre_elem == target)
 if(target > centre_elem)
 	lower_limit = arry.index(centre_elem) + 1
 	binary_search_with_limits(arry, target, lower_limit, upper_limit)
 else
 	upper_limit = arry.index(centre_elem) - 1
 	binary_search_with_limits(arry, target, lower_limit, upper_limit)
 end
end

a = [1,3,5,7,8,9,10,15,20,25]
binary_search(a, 15)
