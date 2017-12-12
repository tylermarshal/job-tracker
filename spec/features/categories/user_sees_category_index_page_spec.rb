require 'rails_helper'

describe "when a user visits the category index page" do
  it "user can see all categories" do
    category = Category.create!(title: "Web Development")
    category = Category.create!(title: "Accounting")
    category = Category.create!(title: "Human Resources")

    visit categories_path

    expect(page).to have_content("Web Development")
    expect(page).to have_content("Account")
    expect(page).to have_content("Human Resources")
  end
end
