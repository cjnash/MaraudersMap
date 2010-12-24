Feature: User log in
  In order access the app
  As user
  I want to log into the app using a username and password
  
Scenario: Sign in page doesn't load
  When I am on the login page
  Then I should see "Sign in"
  And I should see "Username"
  And I should see "Password"

Scenario: Successful log in
  Given "christopher.nash" with "123456" exists
  And I am on the login page
  When I fill in "session_username" with "christopher.nash"
  And I fill in "session_password" with "123456"
  And I press "session_submit"
  Then I should see "Signed in successfully."
  
Scenario: Wrong username
  Given "christopher.nash" with "123456" exists
  And I am on the login page
  When I fill in "session_username" with "jim.gladden"
  And I fill in "session_password" with "123456"
  And I press "session_submit"
  Then I should see "Your magic words were wrong. Try again."
  
Scenario: Wrong username
  Given "christopher.nash" with "123456" exists
  And I am on the login page
  When I fill in "session_username" with "christopher.nash"
  And I fill in "session_password" with "abcdefg"
  And I press "session_submit"
  Then I should see "Your magic words were wrong. Try again."
  
Scenario