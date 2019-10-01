class JobApplicationsController < ApplicationController
    before_action :find_user, only: [:show, :destroy]

  def index
    @job_apps = JobApplication.all
    render json: @job_apps
  end

  def create
    @job_app = JobApplication.create(company: params[:company], cover_letter: params[:cover], user_id: params[:user_id])
    render json: @job_app
  end

  def show
  end

  private

  def job_application_params
    params.require(:job_application).permit(:company, :cover_letter)
  end

  def find_job_app
    @job_app = JobApplication.find(params[:id])
  end
end
