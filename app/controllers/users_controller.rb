class UsersController < ApplicationController
  def create
    @user= User.new(users_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  private

  def users_params
    params.require(:users).permit(:email, :api_token)
  end

end
