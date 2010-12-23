Feature: User log in
  In order access the app
  As user
  I want to log into the app using a username and password

Scenario: Successful log in
  Given I am on the login page
  When I fill in "username" with "christopher.nash"
  And I fill in "password" with "123456"
  And I press "submit"
  Then I should see "Signed in successfully"
