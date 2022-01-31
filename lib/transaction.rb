class Transaction
  attr_reader :date, :amount

  def initialize(date, amount)
    @date = Date.parse(date)
    @amount = amount.to_f
  end
end