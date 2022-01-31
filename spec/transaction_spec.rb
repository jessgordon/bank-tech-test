require 'transaction'

describe Transaction do
  context '#initialisation' do
    it 'is an instance of Transaction' do
      expect(subject).to be_an_instance_of(Transaction)
    end
  end
end