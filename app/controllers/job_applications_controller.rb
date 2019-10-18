class JobApplicationsController < ApplicationController
    before_action :find_user, only: [:show, :destroy]

  def index
    @job_apps = JobApplication.all
    render json: @job_apps
  end

  def user_apps
    apps = User.find_by(id: params[:_json]).job_applications
    render json: apps
  end

  def create
    @job_app = JobApplication.create(company: params[:company], cover_letter: params[:cover], user_id: params[:userId], contact: params[:contact], position: params[:position], source: params[:source], resume: params[:resume])
    render json: @job_app
  end

  def update
    @app = find_job_app
    @app.update(company: params[:company], cover_letter: params[:cover], contact: params[:contact], position: params[:position], source: params[:source], resume: params[:resume])
    render json: User.find_by(id: @app.user_id).job_applications
  end

  def update_weekCheckup
    @app = find_job_app
    @app.update(one_week_checkup: true)
    render json: User.find_by(id: @app.user_id).job_applications
  end

  def update_response
    @app = find_job_app
    @app.update(response: true)
    render json: User.find_by(id: @app.user_id).job_applications
  end

  def update_interview
    @app = find_job_app
    @app.update(interview: true)
    render json: User.find_by(id: @app.user_id).job_applications
  end

  def archive_app
    @app = find_job_app
    @app.update(current: false)
    render json: User.find_by(id: @app.user_id).job_applications
  end

  private

  def find_job_app
    @job_app = JobApplication.find(params[:id])
  end
end
