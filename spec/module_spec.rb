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
  describe '#my_each' do
    it 'Return the elements 1 2 3 4' do
    expect([1, 2, 3, 4].my_each{|x| x}).to eql ([1, 2, 3, 4])
    end
  end
  describe '#my_each_with_index' do
    it 'Return the value and index of array' do
      expect(%w[hello world].my_each_with_index{|x, y| x}).to eql(['hello', 'world']) 
    end
  end
  

end
