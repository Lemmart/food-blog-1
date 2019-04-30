Feature: Navigate through app
  As a blog user
  So that I can explore the page
  I want to be able to filter my results and navigate through them

  Background: the website already has some existing posts
    Given these Users:
      |     email      |   password  |  username  | id |
      | t@example.com  |   testtest  |  "Foodie"  | 1  |
      | t@xmple.com    |   testtest  |  "four"    | 2  |
      | t@ex.com       |   testtest  |  "Foodie"  | 3  |
      | t@e.com        |   testtest  |  "four"    | 4  |
      | t@exam.com     |   testtest  |  "Foodie"  | 5  |

    Given these Posts:
      | caption   | rating  | location  |  time       |   tags         | user_id |
      | Bagel     | 5       |  Frank    | Snack       |   #GoodEATS    |    1    |
      | Bacon     | 4       |  Coop     | Snack       |   #BACON       |    2    |
      | Muffin    | 3       |  Frank    | Breakfast   |   #muffins     |    3    |
      | Chicken   | 2       |  Frank    | Dinner      |   #raw         |    4    |
      | Sushi     | 3       |  Frank    | Breakfast   |   #fresh #cold |    5    |

    Scenario: Search for a post by hashtag
      Given I am on the posts page
      When I fill in the following search term: "#raw"
      Then I should be on the index page
      And I should see that "Chicken" has a rating of 2
      And I should see that the location for "Chicken" is "Frank"
      And I should see that "Chicken" has the tags "#raw"
      And I should see that "Chicken" has a time of "Dinner"
      And I should see that "Chicken" has an image "noimg"
    
    Scenario: Search not found
      Given I am on the posts page
      When I fill in the following search term: "#raw"
      Then I should be on the index page
      And I should see that no results were found

    Scenario: I am on index page
      Given I am on the index page
      And I should see posts in age ascending order