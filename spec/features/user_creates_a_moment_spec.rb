require 'rails_helper.rb'

feature 'Creating moments' do
  scenario 'can create a moment' do
    user = Fabricate(:user)
    visit new_user_session_path
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "#{user.password}"
    click_button "Log in"
    click_link 'New Moment'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'My blood type is coffee'
    click_button 'Create Moment'
    expect(page).to have_content('My blood type is coffee')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
  it 'needs an image to create a moment' do
    user = Fabricate(:user)
    visit new_user_session_path
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "#{user.password}"
    click_button "Log in"
    click_link 'New Moment'
    fill_in 'Caption', with: "No picture because YOLO"
    click_button 'Create Moment'
    expect(page).to have_content('Error! You need an image for creating a moment')
  end
end