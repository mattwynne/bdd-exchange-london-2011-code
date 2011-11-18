Given /^my account has a balance of \$(#{CASH})$/ do |balance|
  my_account.balance = balance
end

When /^I withdraw \$(\d+)$/ do |amount|
  withdraw amount, :from => my_account
end

Then /^\$(\d+) should be dispensed$/ do |amount|
  cash_dispenser.contents.should == amount
end

Then /^the balance of my account should be \$(\d+)$/ do |amount|
  my_account.balance.should == amount
end