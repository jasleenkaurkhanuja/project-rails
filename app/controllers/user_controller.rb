class UserController < ApplicationController
  skip_before_action :authenticate_user, only: [:register, :login]

  def index 
    @users = User.all 
    render json:@users
  end
  def register
    @user = User.create(user_params)
    if @user.save 
      render json: {name: @user.name, email: @user.email}, status: :created 
    else 
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render json: {user: @user, token:token}
    else 
      render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy 
    @user = User.find(params[:id])
    @user.destroy
  end
  def logout
  end
private 
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
