class UsersController < ApplicationController
    before_action :find_user, only: [:show, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
      byebug
  end

  private

def user_params
  params.require(:user).permit(:name, :password)
end

def find_user
  @user = User.find(params[:id])
end

end
