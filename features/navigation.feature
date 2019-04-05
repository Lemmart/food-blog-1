Feature: Navigate through app
  As a blog user
  So that I can explore the page
  I want to be able to filter my results and navigate through them

  Background: the website already has some existing posts
    Given these Posts:
      | caption   | rating  | location  |  time    |   tags         |
      | Bagel     | 5       |  Frank    | 10:00pm  |   #GoodEATS    |
      | Bacon     | 4       |  Coop     | 10:00am  |   #BACON       |
      | Muffin    | 3       |  Frank    | 8:30am   |   #muffins     |
      | Chicken   | 2       |  Frank    | 10:30pm  |   #raw         |
      | Sushi     | 3       |  Frank    | 11:30am  |   #fresh #cold |

    Scenario: Search for a post by hashtag
      Given I am on the posts page
      When I fill in the following search term: "#raw"
      Then I should be on the index page
      And I should see that "Chicken" has a rating of 2
      And I should see that the location for "Chicken" is "Frank"
      And I should see that "Chicken" has the tags "#raw"
      And I should see that "Chicken" has a time of "10:30pm"
      And I should see that "Chicken" has an image "noimg"
    
    Scenario: Search not found
      Given I am on the posts page
      When I fill in the following search term: "#raw"
      Then I should be on the index page
      And I should see that no results were found

    Scenario: I am on index page
      Given I am on the index page
      And I should see posts in age ascending order