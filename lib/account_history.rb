class Account_History
  attr_reader :transactions

  def initialize()
    @transactions = []
  end

  def view()
    statement = "date || credit || debit || balance\n"
    statement_rows = @transactions.map do |transaction|
      statement_line = "#{transaction.date.strftime('%d/%m/%Y')} || "
      if transaction.amount > 0
        statement_line += "#{'%.2f' % transaction.amount} || || "
      elsif transaction.amount < 0 
        statement_line += "|| #{'%.2f' % (transaction.amount * -1)} || "
      else
        statement_line += "|| || "
      end
      statement_line += "#{'%.2f' % transaction.balance}"
    end
    statement += statement_rows.reverse.join("\n")
  end
end