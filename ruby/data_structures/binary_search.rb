class BinarySearch
  def self.call_search
    search([2, 5, 8, 12, 16, 23, 38, 56, 72, 91], 0, 10, 72)
  end

  def search(array, low, high, key)
    mid = low + (high - low) / 2
    p "mid = #{mid}"
    return key if array[mid] == key

    new_array = if key < mid
                  array.select.with_index { |_, index| index < mid }
                else
                  array.select.with_index { |_, index| index > mid }
                end
    p "new_array = #{new_array}"

    search(new_array, 0, new_array.size, key)
  end
end
