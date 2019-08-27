class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    hunts = @user.hunts.where.not(progress: 'pending')
    @captured_monuments = []
    hunts.each { |hunt| @captured_monuments << hunt.monument if captured?(hunt) }
    @x = (@captured_monuments.count / Monument.all.count.to_f * 100).to_i
    all_hunts = @user.hunts
    choix = []
    all_hunts.each do |hunt|
      hunt.choices.each do |choice|
        choix << choice.success
      end
    end
    @total_good_answer = choix.count(true)
  end

  def search
    if params[:post][:person_id] != ""
      user = User.find(params[:post][:person_id])
    else
      user = current_user
    end
    redirect_to user_path(user)
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
        format.html { redirect_to user_path(@user) }
        format.js
      end
    end
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js { render action: :follow }
      end
    end
  end

  def level(level_user)
    total_exp = 100 * level_user
    total_exp
  end

  def level_up
    if current_user.exp > 100
      current_user.level += 1
      current_user.exp = (current_user.exp % 100)
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

  def captured?(hunt)
    choices = hunt.choices
    hunt.score = 0
    choices.each { |choice| hunt.score += 1 if choice.success == true }
    hunt.score > 4
  end
end
