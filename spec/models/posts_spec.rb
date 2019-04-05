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
    
    # it "should fail to create a Post object if any values are missing" do
    #   expect(Post.create!(rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")).to raise_exception(ActiveRecord::NotNullViolation)
    # end

  end
end

RSpec.describe PostsController do
  it { is_expected.to respond_to(:new) }
  it { is_expected.to respond_to(:index) }
  it { is_expected.to respond_to(:edit) }
  it { is_expected.to respond_to(:show) }
  it { is_expected.to respond_to(:create) }
end