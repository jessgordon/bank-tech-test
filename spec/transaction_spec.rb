# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new('14/01/2023', 100.0, 900.0) }
  let(:transaction_with_ints) { Transaction.new('14/01/2023', 100, 900) }

  describe '#initialize(date, amount, balance)' do
    it 'is an instance of Transaction' do
      expect(transaction).to be_an_instance_of(Transaction)
    end

    it 'stores the transaction date' do
      expect(transaction.date).to be_an_instance_of(Date)
      expect(transaction.date.year).to eq(2023)
      expect(transaction.date.mon).to eq(1)
      expect(transaction.date.mday).to eq(14)
    end

    it 'stores the transaction amount (positive float indicates credit, negative float indicates debit)' do
      expect(transaction.amount).to be_an_instance_of(Float)
      expect(transaction.amount).to eq(100.0)
    end

    it 'stores the account balance after the transaction has been completed' do
      expect(transaction.balance).to be_an_instance_of(Float)
      expect(transaction.balance).to eq(900.0)
    end

    it 'converts the transaction amount to a float if passed an integer' do
      expect(transaction_with_ints.amount).to be_an_instance_of(Float)
    end

    it 'converts the account balance to a float if passed an integer' do
      expect(transaction_with_ints.balance).to be_an_instance_of(Float)
    end
  end
end
