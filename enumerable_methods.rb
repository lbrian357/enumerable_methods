module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    return self
  end

  def my_each_with_index
    for i in 0..(self.length - 1)
      yield(self[i], i+1)
    end
    return self
  end

  def my_select
    a = []
    self.my_each{|i| a << i if yield(i) == true}
  end

  def my_all?
    condition = true
    self.my_each{|i| condition = false if yield(i) == false}
    condition
  end

  def my_any?
    condition = false
    self.my_each{|i| condition = true if yield(i) == true}
    condition
  end

  def my_none?
    condition = true
    self.my_each{|i| condition = false if yield(i) != false}
    condition
  end

    
  def my_count
    count = 0
    self.my_each{|i| count += 1}
    count
  end

  def my_map
    a = []
  #  if some_proc.class == false
  #    self.my_each{|i| a << some_proc.call}
 #   else
      self.my_each{|i| a <<  yield(i)}
 #   end
    a
  end

  def my_inject(a = self[0])
    if a != self[0]
      self.my_each {|i| a = yield(a,i) }
    else
      a = self[0]
      self.shift
      self.my_each {|i| a = yield(a,i)}
    end
    a
  end

end

#test #my_inject
def multiply_els(array)
  array.my_inject{|i,j| i*j}
end




