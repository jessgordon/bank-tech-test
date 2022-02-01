# frozen_string_literal: true
require_relative 'transaction'

class AccountHistory
  attr_reader :transactions

  STATEMENT_HEADINGS = "date || credit || debit || balance\n"

  def initialize
    @transactions = []
  end

  def view
    puts STATEMENT_HEADINGS + statement_rows
  end

  def add_transaction(date, amount, balance, class_injection = Transaction)
    @transactions.push(class_injection.new(date, amount, balance))
  end

  private

  def statement_rows
    array_of_statement_rows.reverse.join("\n")
  end

  def array_of_statement_rows
    @transactions.map { |transaction| transaction.statement_format }
  end
end
