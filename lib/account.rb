require 'account_history'
require 'transaction'

class Account
  attr_reader :balance, :history

  def initialize(history = AccountHistory.new)
    @balance = 0.0
    @history = history
  end

  def deposit(amount)
    @balance += amount.to_f
    @history.add_transaction(Date.today, amount, @balance)
    @balance
  end
end
