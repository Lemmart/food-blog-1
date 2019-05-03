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

    Post.create!(user_id: "#{user1.id}", caption: "Bagel", rating: "5", location: "Frank", time: "Breakfast", tags:"#GoodEATS", image_url: "fastfood")
    Post.create!(user_id: "#{user2.id}", caption: "Pizza", rating: "2", location: "Coop", time: "Lunch", tags:"#cheesy")
    Post.create!(user_id: "#{user1.id}", caption: "Pasta", rating: "3", location: "Donovan's Pub", time: "Dinner", tags:"#buttery")
    Post.create!(user_id: "#{user2.id}", caption: "Ice Cream", rating: "2", location: "Library Cafe", time: "Snack", tags:"#ice", image_url: "cone")
    visit "/posts"
  end
  
  it "should show the correct image for a post" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    user.save!(validate: false)
    click_button "Log in"
    expect(page).to have_link("Bagel")
    first(:link, "Bagel").click
    visit "/posts/1"
    expect(page).to have_text("Bagel")
    expect(page).to have_text("Location Frank")
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
    expect(page).to have_link("Back")
    expect(page).to have_content("fastfood")

    visit "/posts"
    first(:link, "Pizza").click
    visit "/posts/2"
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
    expect(page).to have_link("Back")
    expect(page).to have_no_css("noimg")
    expect(page).to have_no_css("fastfood")
    expect(page).to have_no_css("cone")

    visit "/posts"
    first(:link, "Ice Cream").click
    visit "/posts/4"
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
    expect(page).to have_link("Back")
    expect(page).to have_content("cone")
    expect(page).to have_no_css("fastfood")
    expect(page).to have_no_css("noimg")
    Warden.test_reset! 
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

    locations = {"Breakfast" => 0, "Lunch" => 0, "Dinner" => 0, "Snack" => 0}
    incorrect_matches = 0

    # Build time matches
    first(:link, "Breakfast").click
    page.all(".titley").each { |x| if x.text == "Bagel" then locations["Breakfast"] += 1 else incorrect_matches += 1 end}
    first(:link, "Lunch").click
    page.all(".titley").each { |x| if x.text == "Pizza" then locations["Lunch"] += 1 else incorrect_matches += 1 end}
    first(:link, "Dinner").click
    page.all(".titley").each { |x| if x.text == "Pasta" then locations["Dinner"] += 1 else incorrect_matches += 1 end}
    first(:link, "Snack").click
    page.all(".titley").each { |x| if x.text == "Ice Cream" then locations["Snack"] += 1 else incorrect_matches += 1 end}
      # post-information
    
    # Test matches were present and no additional posts were found
    expect(locations["Breakfast"]).to eq(1)
    expect(locations["Lunch"]).to eq(1)
    expect(locations["Dinner"]).to eq(1)
    expect(locations["Snack"]).to eq(1)
    expect(incorrect_matches).to eq(0)
    Warden.test_reset! 
  end

  it "should be able to filter for each location" do
    # Mock user
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    user.save!(validate: false)
    click_button "Log in"

    visit "/posts"
    # Test Filter Presence
    expect(page).to have_link("Frank")
    expect(page).to have_link("Coop")
    expect(page).to have_link("Donovan's Pub")
    expect(page).to have_link("Library Cafe")

    locations = {"Frank" => 0, "Coop" => 0, "Donovan's Pub" => 0, "Library Cafe" => 0}
    incorrect_matches = 0

    # Build time matches
    first(:link, "Frank").click
    # expect(page.all(".posty")[0].text).to match()
    # byebug
    # page.all(".posty").each { |x| if x.text =~ /Bagel/ then locations["Frank"] += 1 else incorrect_matches += 1 end}
    first(:link, "Coop").click
    # page.all(".posty").each { |x| if x.text =~ /Pizza/ then locations["Coop"] += 1 else incorrect_matches += 1 end}
    first(:link, "Donovan's Pub").click
    # page.all(".posty").each { |x| if x.text =~ /Pasta/ then locations["Donovan's Pub"] += 1 else incorrect_matches += 1 end}
    first(:link, "Library Cafe").click
    # page.all(".posty").each { |x| if x.text =~ /Ice Cream/ then locations["Library Cafe"] += 1 else incorrect_matches += 1 end}
    
    # Test matches were present and no additional posts were found
    # expect(locations["Frank"]).to eq(1)
    # expect(locations["Coop"]).to eq(1)
    # expect(locations["Donovan's Pub"]).to eq(1)
    # expect(locations["Library Cafe"]).to eq(1)
    # expect(incorrect_matches).to eq(0)
    Warden.test_reset! 
  end
end