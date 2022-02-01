require 'account'

describe Account do

  let(:account_history) { double(add_transaction: true) }
  let(:account) { Account.new(account_history) }

  describe '#initialize(history = AccountHistory.new)' do
    it 'is an instance of Account' do
      expect(account).to be_an_instance_of(Account)
    end

    it 'initializes the current balance attribute with a value of 0.0' do
      expect(account.balance).to be_an_instance_of(Float)
      expect(account.balance).to eq(0.0)
    end

    it 'initializes and stores an instance of the AccountHistory class in an attribute' do
      expect(account.history).to be(account_history)
    end
  end

  describe '#deposit(amount)' do
    it 'adds amount to the current balance' do
      expect { account.deposit(100.0) }.to change { account.balance }.by(100)
    end
    
    it 'passes transaction details to the account history to be stored' do
      expect(account.history).to receive(:add_transaction)
      account.deposit(100.0)
    end

    it 'converts the amount to a float if passed an integer' do
      expect(account.deposit(3)).to be_an_instance_of(Float)
    end
  end

  describe '#withdraw(amount)' do
    it 'subtracts amount from the current balance' do
      account.deposit(500.0)
      expect { account.withdraw(100.0) }.to change { account.balance }.by(-100)
    end
  end
end
