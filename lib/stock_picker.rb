def max_at_index(arr)
  arr.each_with_index.max[1]
end

def highest_value_index_after(arr, index)
  max_at_index(arr[index + 1..]) + index + 1
end

def highest_value_index_after_each(arr)
  arr[...-1].each_with_index.map do
    |value, index| highest_value_index_after(arr, index)
  end
end

def difference_between_index_values(arr, indexes)
  indexes.each_index.map { |index| arr[indexes[index]] - arr[index] }
end


# @param stock_values [Array<Integer>]
def stock_picker(stock_values)
  max_profit_indexes = highest_value_index_after_each(stock_values)
  profits = difference_between_index_values(stock_values, max_profit_indexes)

  max_profit_start = max_at_index(profits)
  max_profit_end = max_profit_indexes[max_profit_start]

  [max_profit_start, max_profit_end]
end
