Feature: Create category
  In order to categorize the articles
  As a blog administrator
  I want to be able to create categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Go to the New Category page
    Given I am on the admin dashboard page
    When I follow "Categories"
    Then I should see "Categories"
    And I should see "Name" field
    And I should see "Keywords" field
    And I should see "Permalink" field
    And I should see "Description" field
    # And I should see "Cancel" 
    # And I should see "Save" 
  
  
  Scenario: Create a new category
    Given I am on the new category page
    When I fill in "category_name" with "fun"
    And I fill in "category_keywords" with "misc"
    And I fill in "category_description" with "fun misc articles"
    And I press "Save"  
    Then I should see "fun"

  Scenario: Edit a category
    Given I am on the categories page
    And I should see "General"
    When I follow "General"
    Then I fill in "category_description" with "this is a general category."
    And I press "Save"
    Then show me the page
    And I should see "this is a general category."
  
  
  
  
  
