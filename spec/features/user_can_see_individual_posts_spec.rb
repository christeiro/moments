require 'rails_helper'

feature "User can see individual moments" do
  scenario "Can click and view a single moment" do
    moment = Fabricate(:moment)
    visit "/"
    find(:xpath, "//a[contains(@href,'moments/1')]").click
    expect(page.current_path).to eq(moment_path(moment))
  end
end