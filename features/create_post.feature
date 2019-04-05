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
      And I should see "Post was successfully created"
      And I should see that "Pasta" has a rating of 3
      And I should see that the location for "Pasta" is "Frank"
      And I should see that "Pasta" has the tags "#soft #buttery"
      And I should see that "Pasta" has a time of "8:00pm"
      And I should see that "Pasta" has an image "noimg"
    

    ############### NEED HELP ###############
    Scenario: Update a post
      Given I am on the posts page
      Then I should see "Bagel"
      When I click on "Bagel"
      # Then I should see "Rating: 5"
      # And I should see "Caption: Bagel"
      # And I should see "Location: Frank"
      # And I should see "Time: 10:00pm"
      # And I should see "Tags: #GoodEATS"
      # When I press on "Edit"
      # And I fill in "Caption" with "McBagel"
      # And I fill in "Rating" with "4"
      # Then I press "Create Post"
      # I should see "Rating: 4"
      # I should see "Caption: McBagel"
      # I should see "Location: Frank"
      # I should see "Time: 10:00pm"
      # I should see "Tags: #GoodEATS"

    ############### NEED HELP ###############
    Scenario: Delete a post
      Given I am on the posts page
      When I click on "Delete Post"
      # I should see "Post was successfully destroyed."
      # And I should be on the posts page
      # And I should not see "Bagel"
      