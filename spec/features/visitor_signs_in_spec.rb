require "rails_helper"

feature "Visitor signs in" do
  scenario "with valid LDAP username and password", type: :ldap do
    # "ldap_username" and "ldap_password" must be the username and password 
    # for a user in the ladle LDIF yml file
    create_user "ldap_user"
    sign_in_with "ldap_user", "ldap_password"

    user_should_be_signed_in
  end

  scenario "with valid mixed-case LDAP username and password", type: :ldap do
    create_user "ldap_user"
    sign_in_with "Ldap_User", "ldap_password"

    user_should_be_signed_in
  end

  scenario "with invalid password", type: :ldap do
    create_user "ldap_user"
    sign_in_with "ldap_user", "wrong_password"

    page_should_display_sign_in_error    
    user_should_be_signed_out
  end  

  scenario "with invalid username", type: :ldap do 
    sign_in_with "nonexistant_user", "wrong_password"

    page_should_display_sign_in_error    
    user_should_be_signed_out
  end
  
  private

  def create_user(username)
    create(:user, username: username)
  end

  def page_should_display_sign_in_error
    expect(page.body).to include("Invalid username or password.")
  end

  # user_should_be_signed_in
  # user_should_be_signed_out
  # located in: spec/support/features/devise_helpers.rb
end 
