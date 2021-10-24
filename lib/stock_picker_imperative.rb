# Return the day a stock must be bought along with a day the stock must be sold
# in order to obtain the highest profit.
#
# Imperative version of the stock_picker algorithm. No fancy Enumerable methods,
# just simple nested for loop and variables to keep track of highest profit.
# @param stock_values [Array<Integer>]
# @return [Array<Integer>] indexes of the `stock_values` array. The first
#   element refers to which day the stock should be bought, the second refers to
#   which day it should be sold.
def stock_picker(stock_values)
  n = stock_values.length
  max_profit = 0;
  start_day = nil
  end_day = nil

  for i in (0...n)
    for j in (i + 1...n)
      potential_profit = stock_values[j] - stock_values[i]
      if potential_profit > max_profit
        max_profit = potential_profit
        start_day = i
        end_day = j
      end
    end
  end

  [start_day, end_day]
end
