require "rails_helper"

feature "User searches whowas" do
  before do
    stub_whowas_methods
  end  
  
  scenario "with valid data that finds results", js: true do
    fake_sign_in
    visit_whowas_path
    
    search_by_ip_and_port "192.168.1.1", "80", "2015-11-18 11:32:30"
    
    expect(page.find(".whowas-search-results-js")).to have_content "johndoe1"
  end
end
