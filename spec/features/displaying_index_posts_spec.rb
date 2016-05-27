require 'rails_helper'

feature "Index displays a list of moments" do
  scenario "the index displays moments" do
    Fabricate(:moment, caption: "This is the first moment")
    Fabricate(:moment, caption: "This is the second moment")
    visit "/"
    expect(page).to have_content("This is the first moment")
    expect(page).to have_content("This is the second moment")
    expect(page).to have_css("img[src*='coffee']")
  end
end