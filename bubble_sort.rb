def bubble_sort(array)
  n = array.length
  # Loop through the array n-1 times
  (0...n-1).each do |i|
    # Flag to track if any swaps were made in the current pass
    swapped = false
    # Loop through the array from 0 to n-i-1
    (0...n-i-1).each do |j|
      # If the current element is greater than the next element, swap them
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
        swapped = true
      end
    end
    # If no swaps were made in the current pass, the array is already sorted
    break if not swapped
  end
  # Return the sorted array
  array
end
