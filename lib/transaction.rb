class Transaction
  attr_reader :date

  def initialize(date)
    @date = Date.parse(date)
  end
end