Feature: Delete a new post
  As a blog user
  So that I can remove my post
  I want to delete a post

  Background: the website already has some existing posts
    Given these Posts:
      | caption   | rating  | location  |  time    |   tags       | user_id |
      | Bagel     | 5       |  Frank    | 10:00pm  |   #GoodEATS  |    1    |
    Given I am a new, authenticated user with username: "Mass deleter"
    Given I am on the posts page
    When I press "Delete"
    Then I should be on the posts page
    Then I should see "Post was successfully destroyed."