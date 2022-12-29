def stock_picker(prices)
  # variables to store the best buy and sell days
  best_buy_day = 0
  best_sell_day = 0
  # Initialize a variable to store the maximum profit
  max_profit = 0

  # Iterate over each day - except the last
  (0...prices.length - 1).each do |buy_day|
    # Iterate over each day after the current buy day
    (buy_day + 1...prices.length).each do |sell_day|
      # Calculate the profit for the current buy and sell days
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
