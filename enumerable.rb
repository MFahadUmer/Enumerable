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

    x = 0
    for y in self
      yield(x, y)
      x += 1
    end
  end

  def my_select
    return enum_for unless block_given?

    new_array = []
    my_each do |x|
      new_array.push(x) if yield(x)
    end
    new_array
  end

  def my_all?
    return enum_for unless block_given?

    count = 0
    my_each do |x|
      count += 1 if yield(x)
    end
    if count == self.length
      true
    else
      false
    end
  end

  def my_any?
    return enum_for unless block_given?

    count = 0
    my_each do |x|
      count += 1 if yield(x)
    end
    if count.is_positive?
      true
    else
      false
    end
  end

  def my_count
    return enum_for unless block_given?

    count = 0
    my_each do |x|
      count += 1 if yield(x)
    end
    count
  end

  def my_none?
    return enum_for unless block_given?

    count = 0
    my_each do |x|
      count += 1 if yield(x)
    end
    if count.is_zero?
      true
    else
      false
    end
  end

  def my_map(my_proc)
    new_array = []
    my_each do |x|
      if block_given?
        new_array.push(yield(x))
      elsif my_proc.is_a? Proc
        new_array.push(my_proc.call(x))
      else
        return enum_for unless block_given?

      end
    end
    new_array
  end

  def my_inject(*args)
    x = args[0] if args[0].is_a?(Integer)
    operator = args[0].is_a?(Symbol) ? args[0] : args[1]
    if operator
      my_each do |n|
        x = x ? x.send(operator, n) : n
      end
      return x
    end
    my_each do |n|
      x = x ? yield(x, n) : n
    end
    x
  end
end

def multiply_els(args)
  puts args.my_inject(:*)
end
