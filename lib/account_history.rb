# frozen_string_literal: true

class AccountHistory
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def view
    statement = "date || credit || debit || balance\n"
    statement_rows = @transactions.map do |transaction|
      statement_line = "#{transaction.date.strftime('%d/%m/%Y')} || "
      statement_line += if transaction.amount.positive?
                          "#{format('%.2f', transaction.amount)} || || "
                        elsif transaction.amount.negative?
                          "|| #{format('%.2f', (transaction.amount * -1))} || "
                        else
                          '|| || '
                        end
      statement_line + ('%.2f' % transaction.balance).to_s
    end
    statement + statement_rows.reverse.join("\n")
  end
end
