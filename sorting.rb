require 'pry-byebug'

def insert(array, right_index, value)
  # value is the value of array[right_index + 1]
  # right_index is the furthest right sorted element

  # Step through sorted elements right to left.
  # As long as your value is less than the element
  # at array[i] and you still have elements
  i = right_index
  while(i >= 0 && array[i] > value)
    # copy the element
    array[i+1] = array[i]
    i -= 1
  end

  # insert the actual element
  array[i+1] = value;
end

def swap(array, left, right)
  temp = array[right]
  array[right] = array[left]
  array[left] = temp
end

def insertion_sort(array)

  sorted_length = 1

  until sorted_length == array.length - 1
    insert(array, sorted_length, array[sorted_length+1])
    sorted_length += 1
  end

  array
end

def bubble_sort(array)
  num_swaps = true

  while num_swaps
    num_swaps = false
    array.each_with_index do |num, idx|
      if !array[idx+1].nil? && num > array[idx+1]
        swap(array, idx, idx+1)
        num_swaps = true
      end
    end
  end
  array
end

def merge(sub_array1,sub_array2)
  # pop off elements from sub_arrays until they are length 0
    # Compare sub_array1[0] with sub_array2[0]
    # if sub_array1[0] is smaller add to new_array, otherwise use other
  new_array = []

  until sub_array1.length == 0 || sub_array2.length == 0
    #binding.pry
    if sub_array1[0] < sub_array2[0]
      new_array << sub_array1.shift
    else
      new_array << sub_array2.shift
    end
  end

  unless sub_array1
    new_array + sub_array1
  else
    new_array + sub_array2
  end
  new_array
end

def merge_sort(array)

  return array if array.length ==  1 
  half = array.length/2
  if array.length > 2
    array_left = array[0..half]
    array_right = array[half + 1..array.length - 1]
  else
    array_left = [array[0]]
    array_right = [array[1]]
  end

  new_array =  merge(merge_sort(array_left),merge_sort(array_right))

 
# Split array in half until sub-array length is 1
# merge into groups that are sorted

end

puts merge_sort([1,3,7,2,5,8,9,2,3,4])
