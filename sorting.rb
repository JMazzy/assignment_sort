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

def merge(left,right)
  # return right if left empty and vice versa
  if left.empty?
    right
  elsif right.empty?
    left
  # recursively break arrays until one is empty
  elsif left[0] < right[0]
    [left[0]] + merge(left[1...left.length],right)
  else
    [right[0]] + merge(left,right[1...right.length])
  end
end

def merge_sort(array)
  # base case
  return array if array.length <= 1

  # Split array in half at the middle
  left_upper_bound = right_lower_bound = array.length/2

  if array.length.even?
    left_upper_bound -= 1
  else
    right_lower_bound += 1
  end

  # recursively call merge_sort on sub-arrays until they reach base case
  array_left = merge_sort(array[0..left_upper_bound])
  array_right = merge_sort(array[right_lower_bound...array.length]) # why does it work multiple ways? (off-by one error correction?)

  # merge the halves back together
  merge(array_left,array_right)

  # Why oh why don't I work?? VVV
 #  return array if array.length ==  1
 #  half = array.length/2
 #  if array.length > 2
 #   array_left = array[0..half]
 #   array_right = array[half + 1..array.length - 1]
 #  else
 #   array_left = [array[0]]
 #   array_right = [array[1]]
 #  end
end

puts merge_sort([1,3,7,-2,0,5,8,-9,2,3,4])
