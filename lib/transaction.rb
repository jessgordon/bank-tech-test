# frozen_string_literal: true
require 'date'

class Transaction
  attr_reader :date, :amount, :balance

  DEFAULT_DECIMAL_POINTS = 2

  def initialize(date, amount, balance)
    @date = date
    @amount = amount.to_f
    @balance = balance.to_f
  end

  def statement_format
    "#{format_date(self)} || #{format_credit(self)} || #{format_debit(self)} || #{format_balance(self)}"
  end

  private

  def format_date(transaction)
    date = transaction.date.strftime('%d/%m/%Y')
  end

  def format_credit(transaction)
    return unless transaction.amount.positive?
    format_currency(transaction.amount)
  end

  def format_debit(transaction)
    return unless transaction.amount.negative?
    format_currency(transaction.amount * -1)
  end

  def format_balance(transaction)
    format_currency(transaction.balance)
  end

  def format_currency(float)
    format("%.#{DEFAULT_DECIMAL_POINTS}f", float)
  end
end
