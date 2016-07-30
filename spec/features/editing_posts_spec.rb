require 'rails_helper'

feature "User can edit posts" do
  scenario "User edit posts" do
    moment = Fabricate(:moment)
    visit "/"
    find(:xpath, "//a[contains(@href,'moments/#{moment.id}')]").click
    click_button 'Edit moment'
    fill_in :caption, with: "I am able to change caption"

  end
end