module Features
  def visit_lockouts_path
    visit lockouts_path
  end
  
  def create_fake_lockout_data
    create(:lockout, username: "johndoe1", host: "johns-macbook")
  end
  
  def search_lockouts_by_username(username)
    fill_in "lockout_username", with: username
    click_on "Search"
  end
end