require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a Post object which has the correct methods on it" do
      rp = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
      expect(rp).to respond_to :caption
      expect(rp).to respond_to :rating
      expect(rp).to respond_to :location
      expect(rp).to respond_to :time
      expect(rp).to respond_to :tags
    end
  end

  it "should fail to create a Post object if any values are missing" do
      expect {
        Post.create!(rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS").to raise_exception ActiveRecord::NotNullViolation
    }
    end

    it "should be able to comment on a post" do 
        rp = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
        rp.comments.create!(username: "anon", body: "best bagel ever")
        expect(rp.comments[0][:username].should eql "anon")
        expect(rp.comments[0][:body].should eql "best bagel ever")
    end
end
