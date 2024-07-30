Feature: Display Errors Steps

Scenario: Displays error when the user does not select an option for working irregular hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I do not select an option for working irregular hours
    Then I should see an error message saying there is a problem
    And I should see a request to answer this question

Scenario: Displays error when the user does not select an option for time worked
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I do not select an option for time worked
    Then I should see an error message saying there is a problem
    And I should see a request to answer this question

Scenario: Displays error when the user does not select an option for leave year
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I do not select an option for leave year
    Then I should see an error message saying there is a problem
    And I should see a request to answer this question

Scenario: Displays error when the user does not input number of hours worked per week
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I do not input number of hours worked per week
    Then I should see an error message saying there is a problem
    And I should see a request to answer this question

Scenario: Displays error when the user inputs more than 168 hours worked per week
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input more than 168 hours worked per week
    Then I should see an error message saying there is a problem
    And I should see an error message saying the maximum is 168 hours per week

Scenario: Displays error when the user inputs less than 0 hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input less than 0 hours worked per week
    Then I should see an error message saying there is a problem
    And I should see a request to enter at least .5 hours worked

Scenario: Displays error when the user does not input number of days worked per week
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 37.5 hours worked per week
    And I do not input number of days worked per week
    Then I should see an error message saying there is a problem
    And I should see a request to answer this question

Scenario: Displays error when the user inputs more than 7 days worked per week
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 37.5 hours worked per week
    And I input more than 7 days worked per week
    Then I should see an error message saying there is a problem
    And I should see an error message saying there are only 7 days in a week