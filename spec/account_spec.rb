require 'account'

describe Account do

  let(:account_history) { double(add_transaction: true) }
  let(:account) { Account.new(account_history) }

  describe '#initialization' do
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

  describe '#deposit' do
    it 'adds amount passed in as an argument to the current balance' do
      expect { account.deposit(100.0) }.to change { account.balance }.by(100)
    end

    it 'passes transaction details to the account history to be stored' do
      expect(account.history).to receive(:add_transaction)
      account.deposit(100.0)
    end
  end
end