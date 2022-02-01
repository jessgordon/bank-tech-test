# frozen_string_literal: true
require_relative 'transaction'

class AccountHistory
  attr_reader :transactions

  DEFAULT_DECIMAL_POINTS = 2
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
    @transactions.map do |transaction|
      date(transaction) + credit_debit(transaction) + balance(transaction)
    end
  end

  def date(transaction)
    date = transaction.date.strftime('%d/%m/%Y')
    "#{date} || "
  end

  def credit_debit(transaction)
    if transaction.amount.positive?
      "#{format_currency(transaction.amount)} || || "
    elsif transaction.amount.negative?
      "|| #{format_currency(transaction.amount * -1)} || "
    end
  end

  def balance(transaction)
    format_currency(transaction.balance)
  end

  def format_currency(float)
    format("%.#{DEFAULT_DECIMAL_POINTS}f", float)
  end
end
