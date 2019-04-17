Feature: View about page
    As a user
    so that I can view my posts
    I want to be able to see all of my posts in a single page
    

    Background: the website already has some existing posts
        Given these Posts:
            | caption  | rating  | location  |  time    |   tags       | username |
            | Bagel    | 5       |  Frank    | 10:00pm  |   #GoodEATS  | Foodie   |
            | Bacon    | 4       |  Coop     | 10:00am  |   #BACON     | Tester   |
    
    Scenario: View about page
        Given I am a new, authenticated user with username: "Foodie"
        When I go to About
        And I should see "About Foodie"
        And I should see "Bagel"
        And I should not see "About Teseter"
        And I should not see "Bacon"

