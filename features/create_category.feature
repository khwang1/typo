Feature: Create category
  In order to categorize the articles
  As a blog administrator
  I want to be able to create categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Go to the categories page
    Given I am on the admin dashboard page
    When I follow "Categories"
    Then I should see "Categories"
    And I should see "Name"
    And I should see "Keywords"
    And I should see "Permalink"
    And I should see "Description"
  
  

  
