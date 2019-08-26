class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy]

  def index
    if params[:query].present?
      @users = User.where(nickname: params[:query])
    else
      @users = User.where.not(id: current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
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

  def follow
    @user = User.find(params[:id])
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
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
