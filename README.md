# Bank tech test

User can create a bank account, deposit and withdraw money, and view their statement using IRB.

This program was developed using Ruby.

## Getting Started

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/jessgordon/bank-tech-test
   ```
2. Install gems
   ```sh
   bundle install
   ```

### Usage

- Start IRB requiring account.rb
  ```sh
  irb -r ./lib/account.rb
  ```
- Create a new account
  ```sh
  new_account = Account.new
  ```
- Deposit money

  ```sh
  new_account.deposit(100.00)

  => 100.0
  ```

- Withdraw money

  ```sh
  new_account.withdraw(50.00)

   => 50.0
  ```

- View account statement

  ```sh
  new_account.history.view

  date || credit || debit || balance
  01/02/2022 || || 50.00 || 50.00
  01/02/2022 || 100.00 || || 100.00
  ```

Screenshot from IRB:

![IRB Screenshot](./irb_screenshot.png)

### Testing

Tests are written using RSpec, and can be found in the spec folder.

- Run all rspec tests
  ```sh
  rspec
  ```
- Run individual tests
  ```sh
  rspec spec/name_of_test_file.rb
  ```

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Planning

### Approach

- Write user stories to conceptualize required functions
- Diagram class interactions
  - These can be amended throughout the development of this program
  - Add notes on classes as ideas/ improvements pop up
- Decide the order of class development for TDD (loose order, can switch back and forth as I improve the original class interactions and/or responsibilities)
- TDD one class at a time >> one method at a time >> one aspect of a method at a time (again, loosely)
  - Red
  - Green
  - Refactor (including running rubocop)
- Feature test in IRB regularly
- Once all unit tests passing, write a feature test to ensure classes interact as expected
- Consider edge cases
  - Use IRB as an aid to consider edge cases
  - Write tests for edge cases and ensure they pass
- Refactor when all tests passing
  - DRY code
  - SRP principles
  - Readability
  - look out for magic numbers
- Ensure all tests are still passing
- Complete self assessment forms and make improvements from these prompts
- Submit for coach review

### User Stories

As a client\
So that I can add money to my account\
I would like to be able to deposit a specified amount into my bank account

As a client\
So that I can spend money held in my account\
I would like to be able to withdraw a specified amount out of my bank account

As a client\
So that I can see my balance and recent transactions\
I would like to be able to view an account statement, in reverse chronological order

### Diagramming Class Interactions

![Class diagram includes classes: Account, AccountHistory and Transaction](./bank_class_diagram.png)

Account
- responsible for all live interactions
  - stores current balance and an instance of AccountHistory
  - deposit money function
  - withdraw money function

AccountHistory
- responsible for storing historical transactions
  - stores an array of Transaction instances
  - view bank statement function
  - initialises instances of Transaction and pushes them into the transactions array

Transaction
- responsible for storing individual transactions
  - stores an individual transaction's date, amount and balance post transaction
  - converts a transaction into a string to be added as a line on the bank statement

GuardClause
- responsible for error checks
  - checks input for withdraw and deposit methods are numbers, above zero and have no more than two decimal points
  - checks input for withdraw is not more than the funds available within the account

I structured my classes in this way to separate live interactions (Account) from the storage of historical data (AccountHistory & Transaction) and error checking (GuardClause).
I used a transaction class, rather than a hash for each transaction, as I thought it would be best to have each transaction easily available for methods if this was required in the future.

## Improvements
- [ ] Consider using BigDecimal to improve arithmetic accuracy