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
end


