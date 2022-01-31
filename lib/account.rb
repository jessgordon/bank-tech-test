require 'account_history'

class Account
  attr_reader :balance, :history

  def initialize(history = AccountHistory.new)
    @balance = 0.0
    @history = history
  end
end