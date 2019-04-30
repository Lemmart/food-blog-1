Feature: Create a new post
  As a blog user
  So that I can share my opinions on Colgate dining food
  I want to add a post to the blog

  Background: the website already has some existing posts
    Given these Users:
      |     email      |   password  |  username  | id |
      | t@example.com  |   testtest  |  "Foodie"  | 1  |
      | t@xmple.com    |   testtest  |  "four"    | 2  |
      | t@ex.com       |   testtest  |  "Foodie"  | 3  |
    Given these Posts:
      | caption   | rating  | location  |  time       |   tags       | user_id |
      | Bagel     | 5       |  Frank    | Snack       |   #GoodEATS  |    1    |
      | Bacon     | 4       |  Coop     | Breakfast   |   #BACON     |    2    |
      | Muffin    | 3       |  Frank    | Breakfast   |   #muffins   |    3    |

    Scenario: Create a new post without specific image
      Given I am a new, authenticated user with username: "PastaFiend"
      Given I am on the create new post page
      When I select "Frank" from "Location"
      When I select "Dinner" from "Time"
      When I fill in the following:
        | Caption   | Pasta           |
        | Rating    | 3               |
        | Tags      | #soft #buttery  |
      When I press "Create Post"
      Then I should be on the post page
      And I should see "Post was successfully created"
      And I should see that "Pasta" has a rating of 3
      And I should see that the location for "Pasta" is "Frank"
      And I should see that "Pasta" has the tags "#soft #buttery"
      And I should see that "Pasta" has a time of "Dinner"
      And I should see that "Pasta" has an image "noimg"
    
    Scenario: Update a post
      Given I am a new, authenticated user with username: "Serial Updater"
      Given I am on the posts page
      Then I should see "Bagel"
      When I follow "Bagel"
      Then I should see "Rating: 5"
      And I should see "Caption: Bagel"
      And I should see "Location: Frank"
      And I should see "Time: Snack"
      And I should see "Tags: #GoodEATS"
      When I follow "Edit"
      And I fill in "Caption" with "McBagel"
      And I fill in "Rating" with "4"
      Then I press "Create Post"
      And I should see "Rating: 4"
      And I should see "Caption: McBagel"
      And I should see "Location: Frank"
      And I should see "Time: Snack"
      And I should see "Tags: #GoodEATS"
      