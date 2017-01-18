require "rails_helper"

feature "User searches lockouts", focus: true do
  scenario "with valid data that finds results", js: true do
    fake_sign_in
    visit_lockouts_path
    
    create_fake_lockout_data
    
    search_lockouts_by_username "johndoe1"
    
    expect(page.find(".lockouts-search-results-js")).to have_content "johns-macbook"
  end  
end