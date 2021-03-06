require 'rails_helper'

feature "User can edit moment" do
  scenario "User edit moment" do
    user = Fabricate(:user)
    moment = Fabricate(:moment, user: user)
    visit new_user_session_path
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "#{user.password}"
    click_button "Log in"
    find(:xpath, "//a[contains(@href,'moments/#{moment.id}')]").click
    find(:xpath, "//a[contains(@href, 'moments/#{moment.id}/edit')]").click
    # binding.pry
    fill_in "Caption", with: "I am able to change caption"
    attach_file('Image', "spec/files/images/coffee.jpg")
    click_button 'Update Moment'
    expect(page).to have_content("I am able to change caption")
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
  scenario "User delete moment" do
    user = Fabricate(:user)
    moment = Fabricate(:moment, user: user)
    visit new_user_session_path
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "#{user.password}"
    click_button "Log in"
    find(:xpath, "//a[contains(@href,'moments/#{moment.id}')]").click
    find(:xpath, "//a[contains(@href, 'moments/#{moment.id}/edit')]").click
    click_link("Delete")
    expect(page).not_to have_content("#{moment.caption}")
    expect(page).not_to have_css("img[src*='#{moment.image}']")
  end
end