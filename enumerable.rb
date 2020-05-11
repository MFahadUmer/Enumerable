module Enumerable
  def my_each
    return enum_for unless block_given?

    for x in self
      yield(x)
    end
    x
  end

  def my_each_with_index
    return enum_for unless block_given?

    x =0
    for y in self
      yield(x,y)
      x += 1
    end
  end

  def my_select
    return enum_for unless block_given?

    new_array = []
    my_each do |x|
      if yield(x)
      new_array.push(x)
      end
    end
    return new_array
  end

  def my_all?
    return enum_for unless block_given?

    count = 0
    my_each do |x|
    count +=1 if yield(x)
    end
      if count == self.length
        return true
      else
        return false
      end
  end

  def my_any?
    return enum_for unless block_given?

    count = 0
    my_each do |x|
    count +=1 if yield(x)
    end
      if count > 0
        return true
      else
        return false
      end
  end

  def my_count
    return enum_for unless block_given?

    count = 0
    my_each do |x|
      count += 1 if yield(x)
    end
    return count
  end

  def my_none?
    return enum_for unless block_given?

    count = 0
    my_each do |x|
    count +=1 if yield(x)
    end
      if count == 0
        return true
      else
        return false
      end
  end

  def my_map(&my_proc)
    new_array = []
    my_each do |x|
      if block_given?
        new_array.push(yield(x))
      elsif $my_proc.is_a? Proc
        new_array.push(my_proc.call(x))
      else
        return enum_for unless block_given?
        
      end
    end
    return new_array
  end

  def my_inject(*args)
    x = args[0] if args[0].is_a?(Integer)
    operator = args[0].is_a?(Symbol) ? args[0] : args[1]
    if operator
      my_each do
        |n|
        x = x ? x.send(operator, n) : n
      end
      return x
    end
    my_each do |n|
      x = x ? yield(x, n) : n
    end
    return x
  end
  
end

def multiply_els(args)
  puts args.my_inject(:*)
end

my_array = [12,45,67,89,90]
my_array_string = ["I", "Love", "My", "Country"]
my_array.my_each{|x| puts x}
my_array.my_each_with_index{|x, y| puts "Index is #{x}: Value is #{y}"}
puts my_array.my_select{|x| x > 45}
puts my_array.my_all?{|x| x > 53}
puts my_array.my_any?{|x| x > 53}
puts my_array.my_none?{|x| x > 53}
puts my_array.my_count{|x| x > 53}
puts my_array_string.my_map{|x| x.upcase}
my_proc = Proc.new {|x| x.upcase}
puts my_array_string.my_map(&my_proc)
puts my_array_string.my_map
puts my_array.my_inject{ |sum, n| sum + n }
puts [2,3,4,5].my_inject{|x, n| x + n }
puts [2,3,4,5].my_inject(:*)
multiply_els(my_array)
