Feature: Activities
  As a user
  I want to be able to manage activities
  So that I know what I have to work on

  Scenario: Listing activities
    Given that activities exist
    When I'm on the activities page
    Then I should see all the activities

  Scenario: Create an activity
    Given I'm on the new activity page
    When I submit valid data for the new activity
    Then I should see the activity in the activities list

  Scenario: New Activity navigation
    Given I'm on the activities page
    Then I should be able to navigate to the new activity page

  Scenario: Update an activity
    Given I'm editing an activity
    When I submit valid data for the activity
    Then I should see the activity in the activities list

  Scenario: Edit Activity navigation
    Given that activities exist
    And I'm on the activities page
    Then I should be able to navigate to the edit activity page

  Scenario: Deleting an activity
    Given that activities exist
    And I'm on the activities page
    When I delete an activity in the list
    Then the activity should be removed permanently
