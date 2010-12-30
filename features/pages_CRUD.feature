Feature: Pages CRUD
  In order to manage pages
  As a user
  I want to create, read, update or delete pages
  
  Scenario: Successful page create
    Given "christopher.nash" with "123456" exists
    And given the page "AMA Financial is now AMA Toast" by "christopher.nash"
    And I am on pages
    When I follow "Create a New Page"
    And I fill in "page_headline" with "AMA Financial is now AMA Toast" exists
    And I fill in "page_cms_page_id" with "12345"
    And I fill in "page_status" with "Live!"
    And I fill in "page_section" with "Travel"
    And I fill in "page_path" with "Travel/Destination Information/Mexico"
    And I fill in "page_url" with "http://www.ama.ab.ca/travel/travel-insurance"
    And I press "Create Page"
    Then I should see "Page was successfully created."
  
  Scenario: Successful page read
    Given "christopher.nash" with "123456" exists
    And I am on pages
    When I follow "AMA Financial is now AMA Toast"
    Then I should be on "pages/2"
  
  Scenario: Successful page update
    Given "christopher.nash" with "123456" exists
    And I am on pages
    When I follow "AMA Financial is now AMA Toast"
    And I follow "Edit this Page"
    And I fill in "page_status" with "Offline"
    And I press "Update Page"
    Then I should see "Page was successfully updated."
  
  Scenario: Successful page destroy
    Given "christopher.nash" with "123456" exists
    And I am on pages
    When I follow "AMA Financial is now AMA Toast"
    And I follow "Edit this Page"
    And I follow "Destroy This Page"
    And I press "OK"
    Then I should see "The page has vanished."