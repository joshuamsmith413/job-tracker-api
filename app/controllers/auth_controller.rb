class AuthController < ApplicationController

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])

      # token = issue_token({id: user.id})

      token = issue_token(id: @user.id)
      render json: {id: @user.id, name: @user.name, token: token}
    else
      render json: {error: "Please try again"}, status: 401
    end
  end
end
