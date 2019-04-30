require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a Post object which has the correct methods on it" do
      user1 = User.create!(email: "arewein@example.com", password: "arewein", username: "arewein")
      user1.save!(validate: true)

      rp = Post.create!(user_id: "#{user1.id}", caption: "Bagel", rating: "5", location: "Frank", time: "Dinner", tags:"#GoodEATS")
      expect(rp).to respond_to :caption
      expect(rp).to respond_to :rating
      expect(rp).to respond_to :location
      expect(rp).to respond_to :time
      expect(rp).to respond_to :tags
    end
    
    # it "should fail to create a Post object if any values are missing" do
    #   expect(Post.create!(rating: "5", location: "Frank", time: "Dinner", tags:"#GoodEATS")).to raise_exception(ActiveRecord::NotNullViolation)
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
    user1 = User.create!(email: "arewein@example.com", password: "arewein", username: "arewein")
    user1.save!(validate: true)
    user2 = User.create!(email: "arewein@test.com", password: "areare", username: "are")
    user2.save!(validate: true)

    Post.create!(user_id: "#{user1.id}", caption: "Bagel", rating: "5", location: "Frank", time: "Breakfast", tags:"#GoodEATS")
    Post.create!(user_id: "#{user2.id}", caption: "Pizza", rating: "2", location: "Coop", time: "Lunch", tags:"#cheesy")
    Post.create!(user_id: "#{user1.id}", caption: "Pasta", rating: "3", location: "Coop", time: "Dinner", tags:"#buttery")
    Post.create!(user_id: "#{user2.id}", caption: "Ice Cream", rating: "2", location: "Frank", time: "Snack", tags:"#ice")
    visit "/posts"
  end
  
  it "should correctly allow a Post to be be deleted" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    user.save!(validate: false)
    click_button "Log in"
    expect(page).to have_link("Delete")
    names = [] 
    first(:link, "Delete").click
    visit "/posts"
    page.all(".titley").each { |x| names << x.text }
    expect(names.length).to eq(3)
    Warden.test_reset!
  end

  it "should correctly allow for multiple Posts to be deleted"  do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    user.save!(validate: false)
    click_button "Log in"
    expect(page).to have_link("Delete")
    names = [] 
    first(:link, "Delete").click
    visit "/posts"
    first(:link, "Delete").click
    visit "/posts"
    page.all(".titley").each { |x| names << x.text }
    expect(names.length).to eq(2)
    Warden.test_reset! 
  end

  it "should be able to destroy a created Post object" do
    user4 = User.create!(email: "le@example.com", password: "example", username: "four")
    user4.save!(validate: true)
    
    rp = Post.create!(user_id: "#{user4.id}", caption: "Bagel", rating: "5", location: "Frank", time: "Dinner", tags:"#GoodEATS")
    Post.destroy(rp.id)
    rp2 = Post.find_by_id(rp.id)
    expect(rp2).to be_nil
  end

  it "should be able to delete a Post object" do
    user5 = User.create!(email: "plen@test.com", password: "examplen", username: "five")
    user5.save!(validate: true)
    
    rp = Post.create!(user_id: "#{user5.id}", caption: "Bagel", rating: "5", location: "Frank", time: "Dinner", tags:"#GoodEATS")
    rp.destroy
    expect(Post.find_by_id(rp.id)).to eq(nil)
  end

  it "should be able to filter for each time of day" do
    # Mock user
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    user.save!(validate: false)
    click_button "Log in"

    visit "/posts"
    # Test Filter Presence
    expect(page).to have_link("Breakfast")
    expect(page).to have_link("Lunch")
    expect(page).to have_link("Dinner")
    expect(page).to have_link("Snack")

    posts = {"Breakfast" => 0, "Lunch" => 0, "Dinner" => 0, "Snack" => 0}
    incorrect_matches = 0

    # Build matches
    first(:link, "Breakfast").click
    page.all(".titley").each { |x| if x.text == "Bagel" then posts["Breakfast"] += 1 else incorrect_matches += 1 end}
    first(:link, "Lunch").click
    page.all(".titley").each { |x| if x.text == "Pizza" then posts["Lunch"] += 1 else incorrect_matches += 1 end}
    first(:link, "Dinner").click
    page.all(".titley").each { |x| if x.text == "Pasta" then posts["Dinner"] += 1 else incorrect_matches += 1 end}
    first(:link, "Snack").click
    page.all(".titley").each { |x| if x.text == "Ice Cream" then posts["Snack"] += 1 else incorrect_matches += 1 end}
    
    # Test matches were present and no additional posts were found
    expect(posts["Breakfast"]).to eq(1)
    expect(posts["Lunch"]).to eq(1)
    expect(posts["Dinner"]).to eq(1)
    expect(posts["Snack"]).to eq(1)
    expect(incorrect_matches).to eq(0)
    Warden.test_reset! 
  end
end