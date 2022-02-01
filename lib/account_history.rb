# frozen_string_literal: true
require_relative 'transaction'

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
    puts statement += statement_rows.reverse.join("\n")
    statement
  end

  def add_transaction(date, amount, balance, class_injection = Transaction)
    @transactions.push(class_injection.new(date, amount, balance))
  end
end
