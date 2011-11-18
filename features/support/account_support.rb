module DSL
  class ATMAutomator
    include Capybara::DSL
    
    def initialize(cash_dispenser)
      Sinatra::Application.cash_dispenser = cash_dispenser
    end
    
    def authenticate_as(account)
      Sinatra::Application.account = account
    end
    
    def withdraw(amount)
      visit '/'
      fill_in 'Amount', :with => amount
      click_button 'Withdraw'
    end
  end
  
  def my_account
    @my_account ||= Account.new
  end
  
  def withdraw(amount, options)
    account = options[:from]
    teller = Teller.new(cash_dispenser)
    teller.authenticate_as account
    teller.withdraw(amount)
  end
  
  def cash_dispenser
    @cash_dispenser ||= FakeCashDispenser.new
  end
end

World(DSL)