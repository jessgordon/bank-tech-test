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
    update_balance(amount)
    add_transaction_to_account_history(amount)
    @balance
  end
  
  def withdraw(amount)
    amount_guard_clauses(amount)
    enough_funds_guard_clause(amount)
    update_balance(-amount)
    add_transaction_to_account_history(-amount)
    @balance
  end
  
  private
  
  def amount_guard_clauses(amount)
    raise "Amount must be a number" unless ((amount.is_a? Float) || (amount.is_a? Integer))
    raise "Amount cannot be zero" if amount.zero?
    raise "Amount cannot have more than two decimal points" if decimal_points(amount) > 2
  end
  
  def enough_funds_guard_clause(amount)
    return unless amount > @balance
    raise "Not enough funds to withdraw #{format_currency(amount)} - current balance #{format_currency(balance)}"
  end
  
  def update_balance(amount)
    @balance += amount
  end

  def add_transaction_to_account_history(amount)
    @history.add_transaction(Date.today, amount, @balance)
  end

  def decimal_points(amount)
    amount.to_f.to_s.split(".").last.length
  end

  def format_currency(float)
    format('%.2f', float)
  end
end
