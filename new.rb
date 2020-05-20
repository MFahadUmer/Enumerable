module Enumerable
  def my_each
    return enum_for unless block_given?
    y = 0
    while y < length
      yield(self[y])
      y += 1
    end
  end
end

[1,2,3,4,5,6,7].my_each{|x| puts x}
# [1,2,3,4,5,6,7].each