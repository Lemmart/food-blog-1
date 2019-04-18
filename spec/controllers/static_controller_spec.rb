require 'rails_helper'

RSpec.describe StaticController, type: :controller do
    describe "about page", type: :feature do
        before :each do 
            user1 = User.create!(email: "arewein@example.com", password: "arewein", username: "arewein")
            user1.save!(validate: true)
            user2 = User.create!(email: "arewein@test.com", password: "areare", username: "are")
            user2.save!(validate: true)
            Post.create!(user_id: "#{user1.id}", caption: "Bagel", rating: "5", location: "Frank", time: "10:00pm", tags:"#GoodEATS")
            Post.create!(user_id: "#{user2.id}", caption: "Ice Cream", rating: "2", location: "Frank", time: "12:00pm", tags:"#ice")
            visit "/about"
        end
          
        it "should correctly display about page" do
            user = FactoryBot.create(:user)
            user.username = "deadpool"
            login_as(user, :scope => :user, :run_callbacks => false)
            user.save!(validate: true)
            click_button "Log in"
            expect(current_url).to eq("http://www.example.com/about")
            
            #expect(page).to have_link("Ice Cream")
        end
        
        
    end
end
