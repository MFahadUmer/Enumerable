# rubocop:disable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
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

  def my_all?(*args)
    result = true
    my_each do |x|
      if block_given?
        result = false if yield(x) == false
      elsif !block_given? && !args.empty? && !args[0].is_a?(Regexp)
        my_each { |y| result = false unless args[0] === y }
      elsif args[0].is_a?(Regexp)
        my_each { |y| result = false unless y.match(args[0]) }
      elsif !block_given? && args.empty?
        result = false if x.nil? || x == false
      end
    end
    result
  end

  def my_any?(*args)
    result = false
    my_each do |x|
      if block_given?
        result = true if yield(x) == true
      elsif !block_given? && !args.empty? && !args[0].is_a?(Regexp)
        my_each { |y| result = true if args[0] === y }
      elsif args[0].is_a?(Regexp)
        my_each { |y| result = true if y.match(args[0]) }
      elsif !block_given? && args.empty?
        if x.nil? || x == false
        else
          result = true
        end
      end
    end
    result
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

  def my_none?(*args)
    result = true
    my_each do |x|
      if block_given?
        result = false if yield(x) == true
      elsif !block_given? && !args.empty? && !args[0].is_a?(Regexp)
        my_each { |y| result = false if args[0] === y }
      elsif args[0].is_a?(Regexp)
        my_each { |y| result = false if y.match(args[0]) }
      elsif !block_given? && args.empty?
        result = if x.nil? || x == false
            true
          else
            false
          end
      end
    end
    result
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
# rubocop:enable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

def multiply_els(args)
  puts args.my_inject(:*)
end
