require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Web Development")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Human Resources"
    click_button "Update"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Human Resources")
    expect(page).to_not have_content("Web Development")
  end
end
