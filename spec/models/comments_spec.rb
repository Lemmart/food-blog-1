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
end


RSpec.describe CommentsController do
  it { is_expected.to respond_to(:new) }
  it { is_expected.to respond_to(:index) }
  it { is_expected.to respond_to(:edit) }
  it { is_expected.to respond_to(:show) }
  it { is_expected.to respond_to(:create) }
end

    

    # it "should have an index method" do
    #   bagel = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    #   expect(bagel).to respond_to(:index)
    # end

    # it "should have an edit method" do
    #   bagel = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    #   expect(bagel).to respond_to(:edit)
    # end

    # it "should have an create method" do
    #   bagel = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    #   expect(bagel).to respond_to(:create)
    # end

    # it "should have an show method" do
    #   bagel = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    #   expect(bagel).to respond_to(:show)
    # end
#   end
# end
