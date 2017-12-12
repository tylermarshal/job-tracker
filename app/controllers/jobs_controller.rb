class JobsController < ApplicationController

  before_action :set_company, only: [:index, :new, :create]
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @job.update(job_params)

    redirect_to job_path(@job)
  end

  def destroy
    @job.destroy

    flash.notice = "Job '#{@job.title}' has been Deleted!"

    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
