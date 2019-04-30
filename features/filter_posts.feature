Feature: Filter a post
  As a blog user
  So that I can view posts I'm interested in
  I want to filter posts by time

  Background: the website already has some existing posts
    Given these Users:
      |     email      |   password  |  username  | id |
      | t@example.com  |   testtest  |  "Sandra"  | 1  |
      | t@xmple.com    |   testtest  |  "Mallory" | 2  |
      | t@ex.com       |   testtest  |  "Bill"    | 3  |
      | t@exa.com      |   testtest  |  "Jake"    | 4  |
    Given these Posts:
      | caption   | rating  | location  |  time     |   tags       | user_id |
      | Bagel     | 5       |  Frank    | Snack     |   #GoodEATS  |    1    |
      | Bacon     | 4       |  Coop     | Breakfast |   #BACON     |    2    |
      | Sandwich  | 3       |  Frank    | Lunch     |   #muffins   |    3    |
      | Salmon    | 3       |  Frank    | Dinner    |   #fresh     |    4    |
  
  Scenario: Filter posts by time of day
    # Given I am a new, authenticated user with username: "Jacob"
    Given I am on the posts page
    When I press "Breakfast"
    Then I should be on the posts page
    And I should see "Bacon"
    When I press "Lunch"
    Then I should be on the posts page
    And I should see "Sandwich"
    When I press "Dinner"
    Then I should be on the posts page
    And I should see "Salmon"
    When I press "Snack"
    Then I should be on the posts page
    And I should see "Bagel"