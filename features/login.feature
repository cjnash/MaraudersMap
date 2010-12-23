Feature: User log in
  In order access the app
  As user
  I want to log into the app using a username and password

Scenario: Successful log in
  Given "christopher.nash" with "123456" exists
  And I am on the login page
  When I fill in "user_username" with "christopher.nash"
  And I fill in "user_password" with "123456"
  And I press "user_submit"
  Then show me the page
  Then I should see "Signed in successfully"
