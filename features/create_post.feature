Feature: Create a new post
  As a blog user
  So that I can share my opinions on Colgate dining food
  I want to add a post to the blog

  Background: the website already has some existing posts
    Given these Posts:
      | caption   | rating  | location  |  time    |   tags       |
      | Bagel     | 5       |  Frank    | 10:00pm  |   #GoodEATS  |
      | Bacon     | 4       |  Coop     | 10:00am  |   #BACON     |
      | Muffin    | 3       |  Frank    | 8:30am   |   #muffins   |

    Scenario: Create a new post without specific image
      Given I am on the create new post page
      When I fill in the following:
        | Caption   | Pasta           |
        | Rating    | 3               |
        | Location  | Frank           |
        | Time      | 8:00pm          |
        | Tags      | #soft #buttery  |
      When I press "Create Post"
      Then I should be on the post page
      And I should see "New Post 'Pasta' created"
      And I should see that "pasta" has a rating of 3
      And I should see that the location for "pasta" is "Frank"
      And I should see that "pasta" has the tags "#soft #buttery"
      And I should see that "pasta" has a time of "8:00pm"