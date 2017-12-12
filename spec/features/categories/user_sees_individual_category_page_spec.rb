require 'rails_helper'

describe "when a user visits an individual category page" do
  it "user can see the category name" do
    category = Category.create!(title: "Web Development")

    visit category_path(category)

    expect(page).to have_content("Web Development")
  end
end
