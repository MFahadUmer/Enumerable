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
      expect([].my_all? ).to eql(true)
    end
  end
  # describe '#my_each' do
  #   it 'Return the elements 1 2 3 4' do
  #   expect([1, 2, 3, 4].my_each{|x| x}).to eql ([1, 2, 3, 4])
  #   end

  #   it 'Return the keys and values of hashes ' do
  #     expect({name=>Muhammed, language=>ruby}.my_each{|x,y| "key is #{x}, value is #{y}"}).to eql ('key is Muhammed, value is ruby')
  #   end
  # end
  # describe '#my_each_with_index' do
  #   it 'Return the value and index of array' do
  #     expect(%w[hello world].my_each_with_index{|x, y| x}).to eql(['hello', 'world']) 
  #   end
  # end
  describe '#my_select' do
    it 'Return a new array of only even numbers' do
      expect([1, 2, 3, 4, 5, 6].my_select { |n| n.even? }).to eql([2, 4, 6]) 
    end
    it 'Return a new array containing elements starting with "a"' do
      expect(['apple', 'orange', 'banana'].my_select { |fruit| fruit.start_with? "a" }).to eql(['apple']) 
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
      expect([].my_any? ).to eql(false)
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
      expect([].my_none? ).to eql(true)
    end
  end
  

end
