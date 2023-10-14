class Array
  def iterate!
    each_with_index do |n, i|
      self[i] = yield(n)
    end
  end
end

class Array 
  def iterate_with_proc!(&code)
    self.each_with_index do |n, i| 
      self[i] = code.call(n)
    end
  end
end


