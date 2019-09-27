class UsersController < ApplicationController
    before_action :find_user, only: [:show, :destroy, :update]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
   @user = User.create(name: params[:name], password: params[:password])

   if @user.valid?
     render json: @user, status: :created
   else
     render json: { error: 'failed to create user' }, status: :not_acceptable
   end
 end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
