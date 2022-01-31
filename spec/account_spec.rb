require 'account'

describe Account do
  describe '#initialization' do
    it 'is an instance of Account' do
      expect(subject).to be_an_instance_of(Account)
    end

    it 'initializes the current balance attribute with a value of 0.0' do
      expect(subject.balance).to be_an_instance_of(Float)
      expect(subject.balance).to eq(0.0)
    end
  end
end