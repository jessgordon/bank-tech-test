require 'account'

describe Account do

  let(:account_history) { double('account history') }
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
end