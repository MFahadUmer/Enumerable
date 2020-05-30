module Enumerable
def my_inject(*args)
  x = args[0] if args[0].is_a?(Integer)
  operator = args[0].is_a?(Symbol) ? args[0] : args[1]
  if operator
    puts "Yes Operator"
    each do |n|
      x = x ? x.send(operator, n) : n
    end
    return x
  end
  each do |n|
    x = x ? yield(x, n) : n
  end
  x
end
end
# p [1,2,3,4,5,6,7].my_inject(:+)
p (5..10).my_inject(2, :*)
p (1..5).my_inject(4) { |prod, n| prod * n }