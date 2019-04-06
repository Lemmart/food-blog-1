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

RSpec.describe "show page", type: :feature do
  before :each do
    Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    Post.create!(caption: "Ice Cream", rating: "2", location: "Frank", time: "12:00pm", tags:"#ice")
    visit "/posts"
  end
  
  it "should correctly allow a Post to be be deleted" do
    expect(page).to have_link("Delete Post")
    names = [] 
    first(:link, "Delete Post").click
    visit "/posts"
    page.all(".titley").each { |x| names << x.text }
    expect(names.length).to eq(1)
  end

  it "should correctly allow for multiple Posts to be deleted"  do
    expect(page).to have_link("Delete Post")
    names = [] 
    first(:link, "Delete Post").click
    visit "/posts"
    first(:link, "Delete Post").click
    visit "/posts"
    page.all(".titley").each { |x| names << x.text }
    expect(names.length).to eq(0)
  end

  it "should be able to destroy a created Post object" do
    rp = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    Post.destroy(rp.id)
    rp2 = Post.find_by_id(rp.id)
    expect(rp2).to be_nil
  end

  # it "should be able to update a Post object" do
  #   rp = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
  #   rp.update(:caption => "cookie")
    
  #   # expect(page).to have_link("Bagel")
  #   # click_link("Bagel")
  #   # expect(page).to have_link("Edit")
  #   # click_link("Edit")
  #   # fill_in "Caption", :with => "cookie"
  #   # click_button("Create Post")

  #   expect(rp.caption).to eq("cookie")
  # end

  it "should be able to delete a Post object" do
    rp = Post.create!(caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
    rp.destroy
    expect(Post.find_by_id(rp.id)).to eq(nil)
  end
end