Feature: Filter a post
  As a blog user
  So that I can view posts I'm interested in
  I want to filter posts by time

  Background: the website already has some existing posts
    Given these Posts:
      | caption   | rating  | location  |  time     |   tags       | user_id |
      | Bagel     | 5       |  Frank    | Snack     |   #GoodEATS  |    1    |
      | Bacon     | 4       |  Coop     | Breakfast |   #BACON     |    2    |
      | Sandwich  | 3       |  Frank    | Lunch     |   #muffins   |    3    |
      | Salmon    | 3       |  Frank    | Dinner    |   #fresh     |    4    |
    Given I am a new, authenticated user with username: "Jacob"
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