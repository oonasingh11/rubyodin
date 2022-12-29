def stock_picker(prices)
  # variables to store the best buy and sell days
  # set variables to 0
  best_buy_day = 0
  best_sell_day = 0
  # variable to store the maximum profit, also set to 0
  max_profit = 0

  # Iterate over each day - except the last as not possible to sell on same day it is bought
  (0...prices.length - 1).each do |buy_day|
    # Iterate over each day after the current buy day
    (buy_day + 1...prices.length).each do |sell_day|
      # Profit for current buy and sell days
      profit = prices[sell_day] - prices[buy_day]
      # If the profit is greater than the current maximum profit,
      # update the best buy and sell days and the maximum profit
      if profit > max_profit
        max_profit = profit
        best_buy_day = buy_day
        best_sell_day = sell_day
      end
    end
  end

  # Return the best buy and sell days as a pair
  [best_buy_day, best_sell_day]
end
