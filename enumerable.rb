# rubocop:disable ClassLength
module Enumerable
  def my_each
    return enum_for unless block_given?

    y = 0
    while y < length
      yield(self[y])
      y += 1
    end
  end

  def my_each_with_index
    return enum_for unless block_given?

    x = 0
    while x < length
      yield(self[x], x)
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
    count = 0
    my_each do |x|
      if block_given?
        count += 1 if yield(x)
      elsif !x.nil? && !x == false
        count += 1
      end
    end
    count == length
  end

  def my_any?
    count = 0
    my_each do |x|
      if block_given?
        yield(x)
        count += 1
      elsif !x.nil? && !x == false
        count += 1
      end
    end
    if count.positive?
      true
    else
      false
    end
  end

  def my_count(number = nil)
    count = 0
    my_each do |x|
      if block_given? && number.nil?
        count += 1 if yield(x) == true
      elsif !number.nil?
        count += 1 if x == number
      else
        count += 1
      end
    end
    count
  end

  def my_none?
    count = 0
    my_each do |x|
      if block_given?
        count += 1 if yield(x) == false
      elsif x.nil? || x == false
        count += 1
      end
    end
    count == length
  end

  def my_map(my_proc = nil)
    new_array = []
    my_each do |x|
      if my_proc.nil? && block_given?
        new_array.push(yield(x))
      elsif my_proc.nil? && !block_given?
        return enum_for
      else
        new_array.push(my_proc.call(x))
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
# rubocop:enable ClassLength

def multiply_els(args)
  puts args.my_inject(:*)
end
