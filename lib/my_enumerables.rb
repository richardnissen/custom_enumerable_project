module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..self.length - 1 do
      yield self[i], i
    end
    self
  end

  def my_select
    retval = []
    self.my_each do |element|
      retval.push(element) if yield element
    end
    retval
  end

  def my_any?
    self.my_each do |element|
      return true if yield element
    end
    false
  end

  def my_all?
    self.my_each do |element|
      return false unless yield element
    end
    true
  end

  def my_none?
    self.my_each do |element|
      return false if yield element
    end
    true
  end

  def my_map
    retval = []
    self.my_each do |element|
      retval.push(yield element)
    end
    retval
  end

  def my_count
    if block_given?
      counter = 0
      self.my_each do |element|
        counter += 1 if yield element
      end
      counter
    else
      self.size
    end
  end

  def my_inject(retval)
    my_each do |element|
      retval = yield retval, element
    end
    retval
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end
    self
  end
end
