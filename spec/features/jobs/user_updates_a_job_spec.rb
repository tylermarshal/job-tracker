require 'rails_helper'

describe "a user fills out the form to update a job" do
  it "the user fills out the form and clicks submit" do
    category = Category.create!(title: "Web Development")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit edit_job_path(job)

    fill_in "job[title]", with: "Senior Developer"

    click_on "Update Job"

    expect(current_path).to eq(job_path(job))

    expect(page).to have_content("Senior Developer")
  end
end
