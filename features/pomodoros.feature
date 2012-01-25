Feature: Pomodoros
  As a user
  I want to create a pomodoro for an activity
  So that I can focus on the activity until the pomodoro is done

  Background:
    Given that I have activities
    And I'm on the activities page

  @javascript
  Scenario: Start the pomodoro timer for an activity
    When I start the timer for an activity
    Then the timer should be counting down
