Feature: Calculate holiday entitlement

Scenario: Homepage is visible
    Given I navigate to the homepage
    And I should see the homepage

Scenario: Calculate the correct holiday entitlement for an employee who works regular hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 37.5 hours worked per week
    And I input 5 days worked per week
    Then I should see the correct submitted answers
    And I should see the total entitlement hours

Scenario: Calculate the correct holiday entitlement for an employee who works irregular hours


Scenario: Displays the values that were inputted by the user on the summary page

Scenario: Displays error when the user does not select a mandatory field

Scenario: Updates calculation when value is edited
