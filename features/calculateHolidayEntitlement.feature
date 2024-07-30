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


Scenario: Calculate the correct holiday entitlement for an employee who works regular hours and entitlement based on annualised hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button 
    And I select the option no for working irregular hours
    And I select the option for annualised hours
    And I select the option for someone starting and leaving part way through a leave year
    And I input 1 January 2024 for the employment start date
    And I input 20 July 2024 for the employment end date
    Then I should see the correct total entitlement based on annualised hours

Scenario: Calculate the correct holiday entitlement for an employee who works regular hours and entitlement based on compressed hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button 
    And I select the option no for working irregular hours
    And I select the option for compressed hours
    And I select the option for someone leaving part way through a leave year
    And I input 12 July 2024 for the employment end date
    And I input 4 April 2024 dor the leave year start
    And I input 16 for the hours worked per week
    And I input 4 for the days worked per week
    Then I should see the correct total entitlement based on compressed hours

Scenario: Calculate the correct holiday entitlement for an employee who works regular hours and entitlement based on shifts
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button 
    And I select the option no for working irregular hours
    And I select the option for shifts
    And I select the option for someone starting part way through a leave year
    And I input 12 July 2024 for the employment start date
    And I input 4 April 2024 dor the leave year start
    And I input 5 for the hours worked per shift
    And I input 12 for the shifts per shift pattern
    And I input 30 for the days in a shift pattern
    Then I should see the correct total entitlement based on shifts 