Feature: View about page
    As a user
    so that I can view my posts
    I want to be able to see all of my posts in a single page
    

    Background: the website already has some existing posts
        
        Given these Users:
            |     email      |   password  |  username  | id |
            | t@example.com  |   testtest  |  "Foodie"  | 3  |
            | t@mple.com     |   testtest  |  "four"    | 4  |

        Given these Posts:
            | caption  | rating  | location  |  time    |   tags       | user_id  |
            | Bagel    | 5       |  Frank    | 10:00pm  |   #GoodEATS  |   3      |
            | Bacon    | 4       |  Coop     | 10:00am  |   #BACON     |   4      |
    
    Scenario: View about page
        Given I am a new, authenticated user with username: "Foodie"
        When I go to About
        Then I should be on About
        And I should see "About Foodie"
        And I should see "Bagel"
        And I should not see "About Teseter"
        And I should not see "Bacon"

