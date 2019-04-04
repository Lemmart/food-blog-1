Feature: Create a new comment
    As a user
    so that I can comment on a post
    I want to be able to add a new comment

    Background: the website already has some existing posts
        Given these Posts:
            | caption  | rating  | location  |  time    |   tags       |
            | Bagel    | 5       |  Frank    | 10:00pm  |   #GoodEATS  |
            # | Bacon    | 4       |  Coop     | 10:00am  |   #BACON     |
    
    Scenario: Add a comment to a post
        Given I am on the posts page
        When I fill in the following:
            | Username |  Foodie     |
            | Body     | Tastes good |
        When I press "Create Comment"
        Then I should be on the posts page
        And I should see "Foodie"
        And I should see "Tastes good"