require 'rails_helper'

feature "Menu items visibility" do
  scenario "New Moment and Logout links for authenticated user" do
    user = Fabricate(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: "#{user.password}"
    click_button "Log in"
    expect(page).to have_content("Logout")
    expect(page).to have_content("New Moment")
  end
  scenario "Login and Register links for unauthenticated user" do
    visit '/'
    expect(page).to have_content("Login")
    expect(page).to have_content("Register")
  end
end
