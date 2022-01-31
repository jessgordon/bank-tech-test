require 'account_history'

describe Account_History do
  describe '#initialization' do
    it 'is an instance of Account_History' do
      expect(subject).to be_an_instance_of(Account_History)
    end

    it 'has a transactions attribute ready to store transactions within an array' do
      expect(subject.transactions).to be_an_instance_of(Array)
      expect(subject.transactions).to be_empty
    end
  end

  describe '#view()' do
    it 'returns the clients bank statement with date, credit, debit and balance headings' do
      expect(subject.view()).to eq('date || credit || debit || balance')
    end
  end
end