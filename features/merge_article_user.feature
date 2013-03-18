Feature: Merge Articles for Users
  In order to view all articles written on the same topic
  As a user
  I can only view merged articles

  Background:
    Given the blog is set up
	And the user Karen exists
	And the following articles exist:
	  | title     | author   | body                           | allow_comments | allow_pings | published | permalink | user_id |
	  | From Karen 1 | 'karen'  | 'content of the first article by Karen' | 1 | 1 | 1 | 'hello-world' | 2 |
	  | From Karen 2 | 'karen'  | 'content of the second article by Karen' | 1 | 1 | 1 | 'hello-world' | 2 |
	And I am logged in as user Karen
	And I should see "From Karen 1"
	And I should see "From Karen 2"
	
	Scenario: cannot merge articles
	  Given I am on the manage articles page
	  When I edit "From Karen 1"	
	  # Then show me the page
	  # And I should not see "Merge Articles"
	  Then I should not see "Merge Articles"
	  And I should not see "Article ID"
	  And I should not see "Merge"


