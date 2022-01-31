require 'account'

describe Account do
  describe '#initialization' do
    it 'is an instance of Account' do
      expect(subject).to be_an_instance_of(Account)
    end
  end
end