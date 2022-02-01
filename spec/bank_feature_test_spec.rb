require 'account'
require 'date'

describe 'Bank feature test' do
  it 'allows users to create an account, deposit, withdraw and view their bank statement' do
    account = Account.new
    account.deposit(1000.00)
    account.withdraw(200.00)
    date = Date.today.strftime('%d/%m/%Y')
    expect do
      account.history.view
    end.to output("date || credit || debit || balance\n#{date} || || 200.00 || 800.00\n#{date} || 1000.00 || || 1000.00\n").to_stdout
  end
end