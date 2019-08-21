class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_registration_path(resource_name)
  end

  private

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :age, :description, :email, :password, :longitude, :latitude, :photo)
  end
end
