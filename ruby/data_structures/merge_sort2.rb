def merge_sort(arr)
  p arr
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid...])

  merge(left, right)
end

def merge(left, right)
  p left
  p right
  sorted = []
  while left.any? && right.any?
    sorted << if left.first <= right.first
                left.shift
              else
                right.shift
              end
  end

  sorted + left + right
end

array = [14, 9, 12, 22, 69, 420, 62, 17]
s_array = merge_sort(array)

p "Array the greater one: #{s_array.inspect}"
