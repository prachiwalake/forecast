require 'rails_helper'

RSpec.describe "Root path visit", type: :request do
  describe "GET /" do
    it "displays the address form" do
      get root_path
      expect(response).to be_successful 
      expect(response.body).to include("Enter address")
      expect(response.body).to include("Enter Zipcode")
    end
  end
end

RSpec.feature "Address and zipcode Form Submission", type: :feature do
  scenario "User submits the form and is redirected to the check_weather path" do
    # Step 1: Visit the root page
    visit root_path

    # Step 2: Fill out the form
    fill_in "address", with: "Dublin, US"
    fill_in "zipcode", with: "43016"
    click_button "Search"
    
    # Step 3: Check if the user is redirected to the check weathers path which shows weather details
    expect(current_path).to include("/check_weather")
    expect(page).to have_content("Feels")
    expect(page).to have_content("Low")
    expect(page).to have_content("High")
    
  end
end

RSpec.feature "Validate address form", type: :feature do
  scenario "User submits the form without entering address and zipcode" do
    # Step 1: Visit the root page
    visit root_path

    # Step 2: Fill out the form with blanks values
    fill_in "address", with: ""
    fill_in "zipcode", with: ""
    click_button "Search"
    
    # Step 3: Check if the user is redirected to root path with alert message
    expect(current_path).to eq("/")
    expect(page).to have_content("Please enter valid address and zipcode")
  end
end