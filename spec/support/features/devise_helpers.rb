module Features
  def sign_in_path
    new_user_session_path
  end

  def sign_in_with(username, password)
    visit sign_in_path
    fill_in "Username", with: username
    fill_in "Password", with: password
    click_button "Sign in"
  end
  
  def fake_sign_in
    user = create(:user)
    login_as(user, scope: :user)
  end

  def user_should_be_signed_in
    visit root_path
    expect(page).to have_content "Sign out"
  end

  def user_should_be_signed_out
    visit root_path
    expect(page).to have_css "div.sign-in"
  end  
end
