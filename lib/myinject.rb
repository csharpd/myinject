class Array

  def myinject(initial=nil,&block)
    acc = initial
    duplicate_array= self.clone
    acc = duplicate_array.slice!(0) if acc == nil
    duplicate_array.each {|item|
       acc = yield(acc,item)}
    return acc
  end

end
