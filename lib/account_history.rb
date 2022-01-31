class Account_History
  attr_reader :transactions

  def initialize()
    @transactions = []
  end

  def view()
    'date || credit || debit || balance'
  end
end