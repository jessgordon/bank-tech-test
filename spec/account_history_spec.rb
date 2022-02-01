# frozen_string_literal: true

require 'account_history'

describe AccountHistory do
  let(:account_history) { AccountHistory.new }

  describe '#initialize' do
    it 'is an instance of AccountHistory' do
      expect(account_history).to be_an_instance_of(AccountHistory)
    end

    it 'has a transactions attribute ready to store transactions within an array' do
      expect(account_history.transactions).to be_an_instance_of(Array)
      expect(account_history.transactions).to be_empty
    end
  end
  
  describe '#view' do
    let(:transaction1) { double(date: Date.parse('14/01/2023'), amount: 100.0, balance: 900.0) }
    let(:transaction2) { double(date: Date.parse('18/01/2023'), amount: -250.0, balance: 650.0) }

    it 'returns the clients bank statement with date, credit, debit and balance headings' do
      expect { account_history.view }.to output(AccountHistory::STATEMENT_HEADINGS).to_stdout
    end

    it 'returns the clients transactions: credit transaction' do
      account_history.transactions.push(transaction1)

      expect { account_history.view }.to output("#{AccountHistory::STATEMENT_HEADINGS}14/01/2023 || 100.00 || || 900.00\n").to_stdout
    end

    it 'returns the clients transactions: debit transaction' do
      account_history.transactions.push(transaction2)

      expect { account_history.view }.to output("#{AccountHistory::STATEMENT_HEADINGS}18/01/2023 || || 250.00 || 650.00\n").to_stdout
    end

    it 'returns the clients transactions in reverse chronological order' do
      account_history.transactions.push(transaction1)
      account_history.transactions.push(transaction2)

      expect { account_history.view }.to output("#{AccountHistory::STATEMENT_HEADINGS}18/01/2023 || || 250.00 || 650.00\n14/01/2023 || 100.00 || || 900.00\n").to_stdout
    end
  end

  describe '#add_transaction(date, amount, balance, class_injection = Transaction)' do
    let(:transaction_class) { double('Transaction Class', new: 'transaction instance') } 

    it 'initializes an instance of Transaction' do
      expect(transaction_class).to receive(:new)

      account_history.add_transaction(Date.parse('14/01/2023'), 100.0, 100.0, transaction_class)
    end

    it 'adds the Transaction instance to the transactions array' do
      transactions_arr = account_history.add_transaction(Date.parse('14/01/2023'), 100.0, 100.0, transaction_class)
      
      expect(transactions_arr).to be_an_instance_of(Array)
      expect(transactions_arr).to include('transaction instance')
    end
  end
end
