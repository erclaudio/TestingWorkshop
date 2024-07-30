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
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button 
    And I select the option yes for working irregular hours
    And I input 10 October 2024 for the the date the leave starts
    And I input 375 work hours for the hours worked in the pay period
    Then I should see the correct total entitlement hours




Scenario: Updates calculation when value is edited
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button 
    And I select the option yes for working irregular hours
    And I input 10 October 2024 for the the date the leave starts
    And I input 375 work hours for the hours worked in the pay period
    And I should see the correct total entitlement hours
    When I click 'change' for the hours worked in the pay period
    And I input 450 hours
    Then I should see the new correct total entitlement hours


