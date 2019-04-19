# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all
User.delete_all
case Rails.env
when "development"
    # users that create a post
    user1 = User.create!(email: "bill@example.com", password: "arewein", username: "bill")
    user1.save!(validate: true)

    user2 = User.create!(email: "bob@example.com", password: "areare", username: "bob")
    user2.save!(validate: true)

    user3 = User.create!(email: "riley@example.com", password: "testtest", username: "riley")
    user3.save!(validate: true)

    user4 = User.create!(email: "sasha@example.com", password: "example", username: "sasha")
    user4.save!(validate: true)

    user5 = User.create!(email: "claire@example.com", password: "examplen", username: "claire")
    user5.save!(validate: true)

    # users that comment on a post

    comment1 = User.create!(email: "sarah@example.com", password: "arewein", username: "sarah")
    comment1.save!(validate: true)

    comment2 = User.create!(email: "molly@test.com", password: "areare", username: "molly")
    comment2.save!(validate: true)

    comment3 = User.create!(email: "charlie@example.com", password: "testtest", username: "charlie")
    comment3.save!(validate: true)

    comment4 = User.create!(email: "alex@example.com", password: "example", username: "alex")
    comment4.save!(validate: true)

    comment5 = User.create!(email: "olivia@test.com", password: "examplen", username: "olivia")
    comment5.save!(validate: true)

    a = Post.create!(user_id: "#{user1.id}", caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    a.comments.create!(user_id: "#{user1.id}", body: "best bagel ever")
    a.comments.create!(user_id: "#{user2.id}", body: "why is there a hole in the middle? isnt that a donut?")

    b = Post.create!(user_id: "#{user2.id}", caption: "Toast", rating: "1", location: "Frank", time: "10:00am", tags:"#burnt")
    b.comments.create!(user_id: "#{user3.id}", body: "how do you mess up toast?")
    b.comments.create!(user_id: "#{user4.id}", body: "loved the toast")

    c = Post.create!(user_id: "#{user3.id}", caption: "Eggs", rating: "3", location: "Coop", time: "12:00pm", tags:"#raw")
    c.comments.create!(user_id: "#{user5.id}", body: "no salt :(")

    d = Post.create!(user_id: "#{user4.id}", caption: "Bacon", rating: "4", location: "Coop", time: "8:00am", tags:"#YUMMY")
    d.comments.create!(user_id: "#{user1.id}", body: "bacons good, hard to mess up")

    e = Post.create!(user_id: "#{user5.id}", caption: "Cereal", rating: "5", location: "Frank", time: "3:00am", tags:"#bestfoodever")
    e.comments.create!(user_id: "#{user2.id}", body: "I live for the cereal!")
    e.comments.create!(user_id: "#{user3.id}", body: "theres only cereal")
when "production"
    # users that create a post
    user1 = User.create!(email: "bill@example.com", password: "arewein", username: "bill")
    user1.save!(validate: true)

    user2 = User.create!(email: "bob@example.com", password: "areare", username: "bob")
    user2.save!(validate: true)

    comment1 = User.create!(email: "sarah@example.com", password: "arewein", username: "sarah")
    comment1.save!(validate: true)

    comment2 = User.create!(email: "molly@test.com", password: "areare", username: "molly")
    comment2.save!(validate: true)

    a = Post.create!(user_id: "#{user1.id}", caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    a.comments.create!(user_id: "#{user1.id}", username: "#{user1.username}", body: "best bagel ever")
    a.comments.create!(user_id: "#{user2.id}", username: "#{user2.username}", body: "why is there a hole in the middle? isnt that a donut?")
end