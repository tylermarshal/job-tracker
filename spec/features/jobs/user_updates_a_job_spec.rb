require 'rails_helper'

describe "a user fills out the form to update a job" do
  it "the user fills out the form and clicks submit" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Senior Developer"

    click_on "Update Job"

    expect(current_path).to eq(company_job_path(company,job))
    
    expect(page).to have_content("Senior Developer")
  end
end
