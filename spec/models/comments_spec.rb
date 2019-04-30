require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "check attributes and methods" do

    it "should be able to comment on a post" do 
      user1 = User.create!(email: "arewein@example.com", password: "arewein", username: "arewein")
      user1.save!(validate: true)

      comment1 = User.create!(email: "arein@example.com", password: "arewein", username: "anon")
      comment1.save!(validate: true)

      rp = Post.create!(user_id: "#{user1.id}", caption: "Bagel", rating: "5", location: "Frank", time: "Dinner", tags:"#GoodEATS")
      rp.comments.create!(user_id: "#{user1.id}", username: "#{comment1.username}", body: "best bagel ever")
      expect(rp.comments[0][:username]).to eql("anon")
      expect(rp.comments[0][:body]).to eql("best bagel ever")
    end

    it "should be able to have mulitple comments on a post" do
      user2 = User.create!(email: "arewein@test.com", password: "areare", username: "are")
      user2.save!(validate: true)

      comment1 = User.create!(email: "arein@example.com", password: "arewein", username: "anon")
      comment1.save!(validate: true)
      comment2 = User.create!(email: "wein@test.com", password: "areare", username: "anon2")
      comment2.save!(validate: true)

      rp = Post.create!(user_id: "#{user2.id}", caption: "Bagel", rating: "5", location: "Frank", time: "Dinner", tags:"#GoodEATS")
      rp.comments.create!(user_id: "#{user2.id}", username: "#{comment1.username}", body: "best bagel ever")
      rp.comments.create!(user_id: "#{user2.id}", username: "#{comment2.username}", body: "worst bagel ever")
      expect(rp.comments[0][:username]).to eql("anon")
      expect(rp.comments[0][:body]).to eql("best bagel ever")
      expect(rp.comments[1][:username]).to eql("anon2")
      expect(rp.comments[1][:body]).to eql("worst bagel ever")
    end
  end
end


RSpec.describe CommentsController do
  it { is_expected.to respond_to(:new) }
  it { is_expected.to respond_to(:index) }
  it { is_expected.to respond_to(:edit) }
  it { is_expected.to respond_to(:show) }
  it { is_expected.to respond_to(:create) }
end