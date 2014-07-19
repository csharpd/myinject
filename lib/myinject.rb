class Array

  def myinject(initial=nil,&block)
    acc = initial
    acc = self.slice!(0) if acc == nil
    self.each {|item|
       acc = yield(acc,item)}
    return acc
  end

end
