require 'rails_helper'

feature "Index displays a list of moments" do
  scenario "the index displays moments" do
    user = Fabricate(:user)
    Fabricate(:moment, caption: "This is the first moment", user: user)
    Fabricate(:moment, caption: "This is the second moment", user: user)
    visit "/"
    expect(page).to have_content("This is the first moment")
    expect(page).to have_content("This is the second moment")
    expect(page).to have_css("img[src*='coffee']")
  end
end