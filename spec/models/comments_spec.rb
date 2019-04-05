require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "check attributes and methods" do

    it "should be able to comment on a post" do 
        rp = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
        rp.comments.create!(username: "anon", body: "best bagel ever")
        expect(rp.comments[0][:username]).to eql("anon")
        expect(rp.comments[0][:body]).to eql("best bagel ever")
    end

    it "should be able to have mulitple comments on a post" do
      rp = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
      rp.comments.create!(username: "anon", body: "best bagel ever")
      rp.comments.create!(username: "anon2", body: "worst bagel ever")
      expect(rp.comments[0][:username]).to eql("anon")
      expect(rp.comments[0][:body]).to eql("best bagel ever")
      expect(rp.comments[1][:username]).to eql("anon2")
      expect(rp.comments[1][:body]).to eql("worst bagel ever")
    end
end
