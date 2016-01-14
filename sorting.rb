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
  num_swaps = 0

  loop do
    array.each_with_index do |num, idx|
      if !array[idx+1].nil? && num > array[idx+1]
        swap(array, idx, idx+1)
        num_swaps += 1
      end
    end
    break if num_swaps == 0
    num_swaps = 0
  end
  array
end

def merge(sub_array1,sub_array2)
  # 

end

def merge_sort(array)
  new_array = []

# Split array in half until sub-array length is 1
# Put into groups of 2 that are sorted

  new_array
end
