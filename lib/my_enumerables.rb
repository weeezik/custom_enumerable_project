module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield(elem)
    end
  end

  def my_each_with_index
    self.each_with_index do |element, idx|
      yield(element,idx)
    end
  end

  def my_select
    result = Array.new
    self.each do |elem|
      if yield(elem) == true
        result << elem 
      else
        nil
      end
    end
    return result
  end

  def my_all?
    return_value = nil
    self.each do |elem|
      if yield(elem) == true
        return_value = true
      else
        return_value = false
        break
      end
    end
    return return_value
  end

  def my_any?
    return_value = nil
    self.each do |elem|
      if yield(elem) == true
        return_value = true
        break
      else
        return_value = false
      end
    end
    return return_value
  end

  def my_none?
    return_value = nil
    self.each do |elem|
      if yield(elem) == true
        return_value = false
        break
      else
        return_value = true
      end
    end
    return return_value
  end

  def my_count
    if block_given? == true
      elem_count = 0
      self.each do |elem|
        if yield(elem) == true
          elem_count += 1
        end
      end
      return elem_count
    else
      return self.length
    end
  end

  def my_map
    return_enum = []
    self.each do |elem|
      return_enum << yield(elem)
    end
    return return_enum
  end

  def my_inject(initial)
    result = self.inject(initial) do |accum, val|
      yield(accum, val)
    end
    return result
  end

end