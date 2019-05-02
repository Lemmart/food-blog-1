Feature: Create a new post with an image
  As a blog user
  So that I can share my pictures of Colgate dining food
  I want to add a picture to the blog

  Background: the website already has some existing posts
    Given these Users:
      |     email        |   password  |  username   | id |
      | tea@example.com  |   testtest  |  "Foodie"   | 1  |
      | tv@xmple.com     |   testtest  |  "Blogger"  | 2  |
      | teeth@ex.com     |   testtest  |  "yums"     | 3  |
    Given these Posts:
      | caption   | rating  | location  |  time       |   tags       | user_id |
      | Bagel     | 5       |  Frank    | Snack       |   #GoodEATS  |    1    |
      | Bacon     | 4       |  Coop     | Breakfast   |   #BACON     |    2    |
      | Muffin    | 3       |  Frank    | Breakfast   |   #muffins   |    3    |

    Scenario: Create a new post with a specific image
      Given I am a new, authenticated user with username: "PastaFiend"
      Given I am on the create new post page
      When I select "Coop" from "Location"
      When I select "Breakfast" from "Time"
      When I add an image with a name of "fastfood"
      When I fill in the following:
        | Caption   | Omelette        |
        | Rating    | 4               |
        | Tags      | #tomatoes #yum  |
      When I press "Create Post"
      Then I should be on the post page
      And I should see "Post was successfully created"
      And I should see that "Omelette" has a rating of 4
      And I should see that the location for "Omelette" is "Coop"
      And I should see that "Omelette" has the tags "#tomatoes #yum"
      And I should see that "Omelette" has a time of "Breakfast"
      And I should see that "Omelette" does not have an image "noimg"
      When I follow "Omelette"
      Then I should see "Rating: 4"
      And I should see "Caption: Omelette"
      And I should see "Location: Coop"
      And I should see "Time: Breakfast"
      And I should see "Tags: #tomatoes #yum"
      And I should see that "Omelette" has an image filled
      
    Scenario: Create a new post with aanother specific image
      Given I am a new, authenticated user with username: "Ice Cream Lover"
      Given I am on the create new post page
      When I select "Frank" from "Location"
      When I select "Dinner" from "Time"
      When I add an image with a name of "cone"
      When I fill in the following:
        | Caption   | Cone        |
        | Rating    | 5           |
        | Tags      | #cold       |
      When I press "Create Post"
      Then I should be on the post page
      And I should see "Post was successfully created"
      And I should see that "Cone" has a rating of 5
      And I should see that the location for "Cone" is "Frank"
      And I should see that "Cone" has the tags "#cold"
      And I should see that "Cone" has a time of "Dinner"
      And I should see that "Cone" does not have an image "noimg"
      When I follow "Cone"
      Then I should see "Rating: 5"
      And I should see "Caption: Cone"
      And I should see "Location: Frank"
      And I should see "Time: Dinner"
      And I should see "Tags: #cold"
      And I should see that "Cone" has an image filled
      
    
    Scenario: Create a new post without a specific image
      Given I am a new, authenticated user with username: "PastaFiend"
      Given I am on the create new post page
      When I select "Frank" from "Location"
      When I select "Lunch" from "Time"
      When I fill in the following:
        | Caption   | Burrito        |
        | Rating    | 5              |
        | Tags      | #beans         |
      When I press "Create Post"
      Then I should be on the post page
      And I should see "Post was successfully created"
      And I should see that "Burrito" has a rating of 5
      And I should see that the location for "Burrito" is "Frank"
      And I should see that "Burrito" has the tags "#beans"
      And I should see that "Burrito" has a time of "Lunch"
      And I should see that "Burrito" has an image "noimg"
      