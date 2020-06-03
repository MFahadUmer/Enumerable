require './enumerable.rb'
describe Enumerable do
  describe '#my_all?' do
    it 'Return the true' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
    end
    it 'return false' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).to eql(false)
    end
    it 'return false' do
      expect(%w[ant bear cat].my_all?(/t/)).to eql(false)
    end
    it 'return false' do
      expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
    end
    it 'return false' do
      expect([nil, true, 99].my_all?).to eql(false)
    end
    it 'return false' do
      expect([].my_all?).to eql(true)
    end
  end

  describe '#my_each' do
    it 'Return the elements 1 2 3 4' do
      expect([1, 2, 3, 4].my_each{|x| x}).to eql ([1, 2, 3, 4])
    end

    it 'Return Enumeraotr' do
      expect([1, 2, 3, 4, 5].my_each.class).to be([1, 2, 3, 4, 5].select.class)
    end
  end

  describe '#my_each_with_index' do
    it 'Return the value and index of array' do
      expect(%w[hello world].my_each_with_index{ |x, y| x }).to eql(['hello', 'world'])
    end
    it 'Return Enumeraotr' do
      expect([1, 2, 3, 4, 5].my_each_with_index.class).to be([1, 2, 3, 4, 5].select.class)
    end
  end

  describe '#my_select' do
    it 'Return a new array of only even numbers' do
      expect([1, 2, 3, 4, 5, 6].my_select { |x| x.even? }).to eql([2, 4, 6])
    end
    it "Return a new array containing elements starting with 'a'" do
      expect(%w[apple orange banana].my_select { |fruit| fruit.start_with? 'a' }).to eql(['apple'])
    end
    it 'Return Enumeraotr' do
      expect([1, 2, 3, 4, 5].my_select.class).to be([1, 2, 3, 4, 5].select.class)
    end
  end

  describe '#my_any?' do
    it 'Return the true' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
    end
    it 'return false' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
    end
    it 'return false' do
      expect(%w[ant bear cat].my_any?(/t/)).to eql(true)
    end
    it 'return false' do
      expect([1, 2i, 3.14].my_any?(Numeric)).to eql(true)
    end
    it 'return false' do
      expect([nil, true, 99].my_any?).to eql(true)
    end
    it 'return false' do
      expect([].my_any?).to eql(false)
    end
  end

  describe '#my_none?' do
    it 'Return the false' do
      expect(%w[ant bear cat].my_none? { |word| word.length >= 3 }).to eql(false)
    end
    it 'return false' do
      expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).to eql(false)
    end
    it 'return true' do
      expect(%w[and bear car].my_none?(/t/)).to eql(true)
    end
    it 'return true' do
      expect([1, 2i, 3.14].my_none?(String)).to eql(true)
    end
    it 'return false' do
      expect([nil, true, 99].my_none?).to eql(false)
    end
    it 'return true' do
      expect([].my_none?).to eql(true)
    end
  end

  describe '#my_count' do
    it 'Return 4 elements in array are 4' do
      expect([1, 2, 3, 4].my_count).to eql(4)
    end
    it 'Return 4 elements in array are 1' do
      expect([1, 2, 3, 4].my_count(2)).to eql(1)
    end
    it 'Return 4 elements in array are 2' do
      expect([1, 2, 3, 4].my_count { |x| x.even? }).to eql(2)
    end
  end

  describe '#my_map' do
    it 'Return a new array with addition of 2' do
      expect([1, 2, 3, 4, 5].my_map { |x| x + 2 }).to eql([3, 4, 5, 6, 7])
    end
    it 'Return a new array with addition of 2 using proc' do
      my_proc = Proc.new { |x| x + 2 }
      expect([1, 2, 3, 4, 5].my_map(my_proc)).to eql([3, 4, 5, 6, 7])
    end
    it 'Return a new array of true and false' do
      expect([1, 2, 3, 4, 5].my_map { |x| x.even? }).to eql([false, true, false, true, false])
    end
    it 'Return Enumerator' do
      expect([1, 2, 3, 4, 5].my_map.class).to be([1, 2, 3, 4, 5].my_map.class)
    end
  end

  describe '#my_inject' do
    it 'Return 45' do
      expect((5..10).my_inject(:+)).to eql(45)
    end
    it 'Return 45 using block' do
      expect((5..10).my_inject { |sum, n| sum + n }).to eql(45)
    end
    it 'Return 45' do
      expect((5..10).my_inject(1, :*)).to eql(151_200)
    end
    it 'Return 45 using block' do
      expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151_200)
    end
  end
end
