require_relative 'account_history'
require_relative 'transaction'
require 'date'

class Account
  attr_reader :balance, :history

  def initialize(history = AccountHistory.new)
    @balance = 0.0
    @history = history
  end

  def deposit(amount)
    amount_guard_clauses(amount)
    @balance += amount
    @history.add_transaction(Date.today, amount, @balance)
    @balance
  end
  
  def withdraw(amount)
    @balance -= amount
    @history.add_transaction(Date.today, -amount, @balance)
    @balance
  end
  
  private
  
  def amount_guard_clauses(amount)
    raise "Amount must be a number" unless ((amount.is_a? Float) || (amount.is_a? Integer))
    raise "Amount cannot be zero" if amount == 0
    raise "Amount cannot have more than two decimal points" if decimal_points(amount) > 2
  end

  def decimal_points(amount)
    amount.to_f.to_s.split(".").last.length
  end
end
