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
    raise "Amount must be a number" unless ((amount.is_a? Float) || (amount.is_a? Integer))
    raise "Amount cannot be zero" if amount == 0
    decimal_points = amount.to_f.to_s.split(".").last.length
    raise "Amount cannot have more than two decimal points" if decimal_points > 2
    @balance += amount
    @history.add_transaction(Date.today, amount, @balance)
    @balance
  end

  def withdraw(amount)
    @balance -= amount
    @history.add_transaction(Date.today, -amount, @balance)
    @balance
  end
end
