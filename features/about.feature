Feature: View about page
    As a user
    so that I can view my posts
    I want to be able to see all of my posts on a single page
    

    Background: the website already has some existing posts
        
        Given these Users:
            |     email      |   password  |  username  | id |
            | t@example.com  |   testtest  |  "Foodie"  | 3  |
            | t@mple.com     |   testtest  |  "four"    | 4  |

        Given these Posts:
            | caption  | rating  | location  |  time      |   tags       | user_id  |
            | Muffin   | 5       |  Frank    | Snack      |   #GoodEATS  |   3      |
            | Bacon    | 4       |  Coop     | Breakfast  |   #BACON     |   4      |
    
    Scenario: View about page
        Given I am a new, authenticated user with username: "Foodie"
        When I go to the about page
        Then I should be on the about page
        And I should see "About Foodie"

    Scenario: View about page with previous posts displayed
        Given I am a new, authenticated user with username: "four"
        Given I am on the create new post page
        When I select "Frank" from "Location"
        When I select "Dinner" from "Time"
        When I fill in the following:
            | Caption   | Bagel           |
            | Rating    | 4               |
            | Tags      | #yum            |
        When I press "Create Post"
        Then I should be on the post page
        And I should see "Post was successfully created"
        When I go to the about page
        Then I should be on the about page
        And I should see "Bagel"