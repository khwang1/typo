Feature: Merge Articles
  In order to allow users to view all articles written on the same topic
  As a blog administrator
  I want to be able to merge articles

  Background:
    Given the blog is set up
	And the following articles exist:
	  | title     | author   | body                           | allow_comments | allow_pings | published | permalink |
	  | Article 1 | 'admin'  | 'content of the first article' | 1 | 1 | 1 | 'hello-world' |
	  | Article 2 | 'admin'  | 'content of the second article' | 1 | 1 | 1 | 'hello-world' |
    And I am logged into the admin panel
	And I should see "All Articles"
	When I follow "All Articles"
	Then I should see "Article 1"
	And I should see "Article 2"

  Scenario: A admin can merge two articles
	Given I am on the manage articles page
	When I edit "Article 1"
	Then I should see "Merge Articles"
	And I should see "Article ID"
	
  Scenario: A non-admin cannot merge two articles

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
	




  
