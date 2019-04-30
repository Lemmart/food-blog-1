Feature: Create a new comment
    As a user
    so that I can comment on a post
    I want to be able to add a new comment
    

    Background: the website already has some existing posts
        Given these Users:
            |     email      |   password  |  username  | id |
            | t@example.com  |   testtest  |  "Foodie"  | 1  |
        Given these Posts:
            | caption  | rating  | location  |  time      |   tags       | user_id |
            | Bagel    | 5       |  Frank    | Breakfast  |   #GoodEATS  |    1    |
    
    Scenario: Add a comment to a post
        Given I am a new, authenticated user with username: "Foodie"
        When I fill in the following:
            | Body     | Tastes good |
        When I press "Create Comment"
        And I should see "Foodie"
        And I should see "Tastes good"