require 'transaction'

describe Transaction do

  let(:transaction) { Transaction.new('14/01/2023') }

  context '#initialisation' do
    it 'is an instance of Transaction' do
      expect(transaction).to be_an_instance_of(Transaction)
    end

    it 'stores the transaction date' do
      expect(transaction.date).to be_an_instance_of(Date)
      expect(transaction.date.year).to eq(2023)
      expect(transaction.date.mon).to eq(1)
      expect(transaction.date.mday).to eq(14)
    end
  end
end