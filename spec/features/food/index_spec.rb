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
    expect(page).to have_content("Total hits: 51270")
  end

  it "I fill in the search form with 'sweet potatoes' and click 'search' I should see a list of TEN foods related to sweet potatoes" do 
      
    within(".search-field") do
      fill_in(:q, with: "sweet potatoes")
      click_button("Search")
    end

    expect(current_path).to eq(foods_path)

    within(".food_list") do
      expect(page).to have_selector("li", count: 10)
      expect(page).to have_content("8901020020844, SWEET POTATOES, NOT A BRANDED ITEM, ORGANIC SWEET POTATOES.")
      expect(page).to have_content("826561500014, SWEET POTATOES, Spring Acres Sales Company Inc.,")
      expect(page).to have_content("638882125773, SWEET POTATOES, Stahlbush Island Farms, Inc., SWEET POTATOES.")
    end   
  end
end