# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all

a = Post.create!(username: "buddy",caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
a.comments.create!(username: "anon", body: "best bagel ever")
a.comments.create!(username: "yee", body: "why is there a hole in the middle? isnt that a donut?")

b = Post.create!(username: "buddy2",caption: "Toast", rating: "1", location: "Frank", time: "10:00am", tags:"#burnt")
b.comments.create!(username: "teacher", body: "how do you mess up toast?")
b.comments.create!(username: "no one", body: "loved the toast")

c = Post.create!(username: "buddy3", caption: "Eggs", rating: "3", location: "Coop", time: "12:00pm", tags:"#raw")
c.comments.create!(username: "L", body: "no salt :(")

d = Post.create!(username: "notbuddy", caption: "Bacon", rating: "4", location: "Coop", time: "8:00am", tags:"#YUMMY")
d.comments.create!(username: "meat lover", body: "bacons good, hard to mess up")

e = Post.create!(username: "buddy3",caption: "Cereal", rating: "5", location: "Frank", time: "3:00am", tags:"#bestfoodever")
e.comments.create!(username: "late nighter", body: "I live for the cereal!")
e.comments.create!(username: "its late", body: "theres only cereal")