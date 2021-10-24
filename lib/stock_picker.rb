# Find the index of the highest value in the array
# @param arr [Array<Comparable>] array to be searched
# @return index of the largest element
def max_at_index(arr)
  arr.each_with_index.max[1]
end

# Find the index of the highest value index in an array, starting the search
# after a certain given index.
# @param arr [Array<Comparable>] array to be searched
# @param index [Integer] search starts one index after this one
# @return The index of the highest value appearing after the given index
def highest_value_index_after(arr, index)
  max_at_index(arr[index + 1..]) + index + 1
end

# For each element in the array (apart from the last one), map an index of the
# largest element that appears after the original element
# @param arr [Array<Comparable>] array to base the mapping on
# @return [Array[Integer]] array of indexes referring to the highest elements
#   in the original array that come after their position in the array
def highest_value_index_after_each(arr)
  arr[...-1].each_with_index.map do
    |value, index| highest_value_index_after(arr, index)
  end
end

# For each element in the first array, subtract the value of that element from the
# value of the element whose index is specified at the same position in the
# second array (refers to elements in first array).
# @param arr [Array<Numeric>] with the values of the elements. Must have a
#   length at least that of the `indexes` array
# @param indexes [Array<Integer>] holds indexes of the pairs for elements in `arr`
def difference_between_index_values(arr, indexes)
  indexes.each_index.map { |index| arr[indexes[index]] - arr[index] }
end

# Return the day a stock must be bought along with a day the stock must be sold
# in order to obtain the highest profit.
# @param stock_values [Array<Integer>]
# @return [Array<Integer>] indexes of the `stock_values` array. The first
#   element refers to which day the stock should be bought, the second refers to
#   which day it should be sold.
def stock_picker(stock_values)
  max_profit_indexes = highest_value_index_after_each(stock_values)
  profits = difference_between_index_values(stock_values, max_profit_indexes)

  max_profit_start = max_at_index(profits)
  max_profit_end = max_profit_indexes[max_profit_start]

  [max_profit_start, max_profit_end]
end
