class ChangeMaker
  # Returns an array of the least amount of coins required to get to 'amount'
  # **Assumption** Change can always be made - BONUS POINTS - raise an error if
  # change can not be made
  # Params:
  # +amount+:: The amount to make change for
  # +denominations+:: An array containing the denominations that can be used.
  #                   Defaults to standard US coin denominations
  def self.make_change(amount, denominations=[1,5,10,25])
    solution = []
    denominations.reverse.each do |coin|
      (amount/coin).floor.times do
        solution << coin
        amount -= coin
      end
    end
    if amount != 0
      raise ChangeError
    else
      solution
    end
  end
end

class ChangeError < StandardError; end
