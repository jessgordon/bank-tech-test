require_relative 'account_history'
require_relative 'transaction'
require_relative 'guard_clause'
require 'date'

class Account
  attr_reader :balance, :history

  DEFAULT_BALANCE = 0.0

  def initialize(history = AccountHistory.new)
    @balance = DEFAULT_BALANCE
    @history = history
  end

  def deposit(amount)
    GuardClause.amount(amount)
    update_balance(amount)
    add_transaction_to_account_history(amount)
    @balance
  end
  
  def withdraw(amount)
    GuardClause.amount(amount)
    GuardClause.enough_funds(amount, @balance)
    update_balance(-amount)
    add_transaction_to_account_history(-amount)
    @balance
  end
  
  private
  
  def update_balance(amount)
    @balance += amount
  end

  def add_transaction_to_account_history(amount)
    @history.add_transaction(Date.today, amount, @balance)
  end
end
