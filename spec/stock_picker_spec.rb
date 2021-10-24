require_relative "../lib/stock_picker"
require_relative "../lib/stock_picker_imperative"

describe "stock_picker" do
  describe "#stock_picker" do
    it "returns the pair of days that gives the most profit" do
      input = [17,3,6,9,15,8,6,1,10]
      expected = [1,4]
      expect(stock_picker(input)).to eql(expected)
    end
  end

  describe "#highest_value_index_after" do
    it "returns the index of the highest value after the given index" do
      arr = [10, 20, 3, 5, 6, 9]
      index = 1
      expected = 5
      expect(highest_value_index_after(arr, index)).to eql(expected)
    end
  end

  describe "#highest_value_index_after_each" do
    it "returns an array of indexes of the highest value " \
       "appearing after the element of that index in the original array" do
      arr = [10, 20, 3, 5, 6, 9]
      expected = [1, 5, 5, 5, 5]
      expect(highest_value_index_after_each(arr)).to eql(expected)
    end

    it "works for another array" do
      arr = [17,3,6,9,15,8,6,1,10]
      expected = [4, 4, 4, 4, 8, 8, 8, 8]
      expect(highest_value_index_after_each(arr)).to eql(expected)
    end
  end

  describe "#difference_between_index_values" do
    it "returns an array of differences between values" do
      arr = [10, 20, 3, 5, 6, 9]
      indexes = [1, 5, 5, 5, 5]
      expected = [10, -11, 6, 4, 3]
      expect(difference_between_index_values(arr, indexes)).to eql(expected)
    end
    it "works for another dataset" do
      arr = [17,3,6,9,15,8,6,1,10]
      indexes = [4, 4, 4, 4, 8, 8, 8, 8]
      expected = [-2, 12, 9, 6, -5, 2, 4, 9]
      expect(difference_between_index_values(arr, indexes)).to eql(expected)
    end
  end

  describe "#max_at_index" do
    it "returns the index of the largest element" do
      arr = [6, 7, 10, 2, 1, 3]
      expected = 2
      expect(max_at_index(arr)).to eql(expected)
    end
  end

end

describe "stock_picker_imperative" do
  describe "#stock_picker" do
    it "returns the pair of days that gives the most profit" do
      input = [17,3,6,9,15,8,6,1,10]
      expected = [1,4]
      expect(stock_picker(input)).to eql(expected)
    end
  end
end
