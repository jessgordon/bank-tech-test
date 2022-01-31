require 'account_history'

describe Account_History do
  describe '#initialization' do
    it 'is an instance of Account_History' do
      expect(subject).to be_an_instance_of(Account_History)
    end
  end
end