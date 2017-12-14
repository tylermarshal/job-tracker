class DashboardController < ApplicationController

  def index
    @count_jobs_by_interest_20 = Job.all.count_jobs_by_interest(0,20)
    @count_jobs_by_interest_40 = Job.all.count_jobs_by_interest(20,40)
    @count_jobs_by_interest_60= Job.all.count_jobs_by_interest(40,60)
    @count_jobs_by_interest_80 = Job.all.count_jobs_by_interest(60,80)
    @count_jobs_by_interest_100 = Job.all.count_jobs_by_interest(80,100)
    @count_jobs_by_location = Job.all.count_jobs_by_location
    @top_three_companies = Company.all.top_three_companies
  end
end
