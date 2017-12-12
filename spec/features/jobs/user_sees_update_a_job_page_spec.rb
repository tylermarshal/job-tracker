require 'rails_helper'

describe "a user visits update a job page" do
  it "the user can see the edit form" do
    category = Category.create!(title: "Web Development")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit edit_company_job_path(company,job)

    expect(page).to have_content("Title")
    expect(page).to have_content("Description")
    expect(page).to have_content("Level of interest")
    expect(page).to have_content("City")
    expect(page).to have_field("job[title]")
    expect(page).to have_field("job[description]")
    expect(page).to have_field("job[level_of_interest]")
    expect(page).to have_field("job[city]")
  end
end
