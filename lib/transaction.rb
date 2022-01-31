class Transaction
  attr_reader :date, :amount, :balance

  def initialize(date, amount, balance)
    @date = Date.parse(date)
    @amount = amount.to_f
    @balance = balance.to_f
  end
end