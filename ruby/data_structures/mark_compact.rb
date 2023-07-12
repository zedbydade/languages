heap = Array.new(rand(100))
heap[50] = "tu"
heap[11] = "tu"
heap[17] = "ru"

def compact_array(arr)
  arr.each_with_index { |val, index| 
    if val 
      arr[index] = nil
      arr[index - 1] = val
    end
  }
  compact_array(arr) unless arr[0] == "tu" && arr[1] == "tu" && arr[2] == "ru"
end

compact_array(heap)


