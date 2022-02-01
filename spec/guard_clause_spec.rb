require 'guard_clause'

describe GuardClause do
  describe 'self.amount(amount)' do
    it 'throws an error if amount is not an int or float' do
      expect { described_class.amount('three') }.to raise_error "Amount must be a number"       
    end

    it 'throws an error if amount is zero' do
      expect { described_class.amount(0) }.to raise_error "Amount cannot be zero"       
    end

    it 'throws an error if amount has more than two decimal points' do
      expect { described_class.amount(0.999) }.to raise_error "Amount cannot have more than two decimal points"       
    end
  end

  describe 'self.enough_funds(amount, balance)' do
    it 'throws an error if there are not enough funds in the account to withdraw amount requested' do
      expect { described_class.enough_funds(1000.0, 500.0) }.to raise_error "Not enough funds to withdraw 1000.00 - current balance 500.00"
    end
  end
end
