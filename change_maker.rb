class ChangeMaker
  # Returns an array of the least amount of coins required to get to 'amount'
  # **Assumption** Change can always be made - BONUS POINTS - raise an error if
  # change can not be made
  # Params:
  # +amount+:: The amount to make change for
  # +denominations+:: An array containing the denominations that can be used.
  #                   Defaults to standard US coin denominations
  def self.make_change(amount, denominations=[1,5,10,25])
    num_coins_needed = []
    solutions_array = []

    # initialize arrays
    (0..amount).each do |val|
      num_coins_needed[val] = nil
      solutions_array[val] = []
    end

    # establish base case
    num_coins_needed[0] = 0
    solutions_array[0] = []

    (1..amount).each do |val|
      current_coins_needed = Float::INFINITY
      current_coin_solution = []

      denominations.each do |coin|
        if coin <= val
          if (num_coins_needed[val - coin] + 1) < current_coins_needed
            current_coins_needed = num_coins_needed[val - coin] + 1
            current_coin_solution = solutions_array[val - coin] + [coin]
          end
        end
      end
      num_coins_needed[val] = current_coins_needed
      solutions_array[val] = current_coin_solution
    end

    if solutions_array.last.length == 0
      raise ChangeError
    else
      solutions_array.last
    end
  end
end

class ChangeError < StandardError; end
