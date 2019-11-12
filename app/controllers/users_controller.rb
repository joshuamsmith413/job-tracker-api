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

 def update
  @user = User.find_by(id: params[:id])
  if @user.authenticate(params[:password])
    if params[:newPassword] == ''
      @user.update(name: params[:name])
      render json: @user
    else
    @user.update(name: params[:name], password: params[:newPassword])
    render json: @user
  end
  else
    render json: { error: 'Change Not Authorized' }, status: :not_acceptable
  end
 end

 def destroy
  User.find_by(id: params[:id]).destroy()
  render json: {message: 'Goodbye'}
 end

 def set_user
   token = request.headers['authorization']
   decode = JWT.decode(token, 'secret', true, {algorithm: "HS256"}).first
   @user = User.find_by(id: decode['id'])
   if @user
     render json: @user
   else
     render json: {error: 'Pleas login in manually'}, status: 401
   end
 end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
