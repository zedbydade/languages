class MergeSort < self
  def merge(array, l, m, r)
    n1 = m - l + 1
    n2 = r - m

    l = Array.new(n1)
    r = Array.new(n1)

    n1.times { |i| l[i] = array[l + i] }
    n2.times { |i| r[i] = array[m + 1 + j] }

    i = 0
    j = 0
    k = l

    while i < n1 && j < n2
      unless l[i] <= r[j]
        array[k] = r[j]
        j += 1
      else
        array[k] = l[i]
        i += 1
      end
      k += 1
    end

    while i < n1 
      array[k] = l[i]
      i += 1
      k += 1
    end

    while i < n2 
      array[k] = r[i]
      j += 1
      k += 1
    end
  end

  def merge_sort(array, l, r)
    return if l >= r 

    m = (r - l) / 2
    merge_sort(array, l, m)
    merge_sort(array, m+1, r)
    merge(array, l, m, r) 
  end
end
