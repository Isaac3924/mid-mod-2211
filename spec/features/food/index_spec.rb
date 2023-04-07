require "rails_helper"

RSpec.describe "Food Index Page" do 
  before(:each) do 
    visit root_path
  end

  describe "As a user, when visiting '/'" do 
    it "I fill in the search form with 'sweet potatoes'" do 
      save_and_open_page
      within(".search-field") do
        fill_in(:q, with: "sweet potatoes")
        click_button("Search")
      end
    end
  end
end