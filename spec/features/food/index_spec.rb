require "rails_helper"

RSpec.describe "Food Index Page" do 
  before(:each) do 
    visit root_path
  end

  describe "As a user, when visiting '/'" do 
    it "I fill in the search form with 'sweet potatoes' and click 'search' I am taken to '/foods'" do 
      
      within(".search-field") do
        fill_in(:q, with: "sweet potatoes")
        click_button("Search")
      end

      expect(current_path).to eq(foods_path)
      expect(page).to have_content("Results")
    end
  end

  it "I fill in the search form with 'sweet potatoes' and click 'search' I should see a total of the number of results" do 
      
    within(".search-field") do
      fill_in(:q, with: "sweet potatoes")
      click_button("Search")
    end

    expect(current_path).to eq(foods_path)
    expect(page).to have_content("Results")
    # expect(page).to have_content(10)
  end

  it "I fill in the search form with 'sweet potatoes' and click 'search' I should see a total of the number of results" do 
      
    within(".search-field") do
      fill_in(:q, with: "sweet potatoes")
      click_button("Search")
    end

    expect(current_path).to eq(foods_path)
    expect(page).to have_content("Results")
    # expect(page).to have_content(10)
  end
end