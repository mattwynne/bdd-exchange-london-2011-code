class Account
  def balance=(new_balance)
    @balance = new_balance
  end
  
  def balance
    @balance
  end
end

class Teller
  def initialize(cash_dispenser)
    @cash_dispenser = cash_dispenser
  end
  
  def authenticate_as(account)
    @account = account
  end
  
  def withdraw(amount)
    @account.balance -= amount
    @cash_dispenser.dispense(amount)
  end
end

class FakeCashDispenser
  attr_reader :contents
  
  def dispense(amount)
    @contents = amount
  end
end

require 'sinatra'

set(:cash_dispenser) { raise("set my cash_dispenser") }
set(:account) { raise("set my account") }

get '/' do
  %{
    <html>
      <body>
        <form action="/withdraw" method="post">
          <label for="amount">Amount</label>
          <input type="text" name="amount" id="amount">
          <input type="submit" value="Withdraw">
        </form>
      </body>
    </html>
  }
end

post '/withdraw' do
  amount = params[:amount].to_i
  teller = Teller.new(settings.cash_dispenser)
  teller.authenticate_as(settings.account)
  teller.withdraw(amount)
end