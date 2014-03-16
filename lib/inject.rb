class Array

  def my_inject(arg=nil) 
    # don't use an argument if the first element of the array is nil!
    result = arg
    if result.nil?
      result = self.first
      self[1..-1].each { |el| result = yield result, el } 
    else
      self.each { |el| result = yield result, el } 
    end
    result
  end

  def inject_recursive(arg=nil, &block)
    # don't use an argument if the first element of the array is nil!
    result = arg
    if result.nil?
      return self.first if self.size == 1
      result = self.first
      self[1..-1].inject_recursive(result, &block)
    else
      return yield result, self.first if self.size == 1
      result = yield result, self.first
      self[1..-1].inject_recursive(result, &block)
    end
  end
end