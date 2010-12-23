Given /^"([^"]*)" with "([^"]*)" exists$/ do |arg1, arg2|
  User.create(:username => arg1, :password => arg2)
end
