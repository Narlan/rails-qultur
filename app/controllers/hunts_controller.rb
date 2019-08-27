class HuntsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:scanned]

  def create
    hunt_already_exist = false
    monument = Monument.find(params[:monument_id])
    hunts = current_user.hunts
    hunts.each do |hunt|
      hunt.current_hunt = false
      if hunt.monument.id == monument.id
        hunt.current_hunt = true
        hunt_already_exist = true
      end
      hunt.save
    end
    Hunt.create(current_hunt: true, progress: 0, monument: monument, user: current_user) unless hunt_already_exist
    redirect_to monument_path(monument)
  end

  def scanned
    actual_hunt = nil
    hunt_already_exist = false
    monuments = Monument.where("qrcode = '#{params[:url]}'")
    if monuments.length > 0
      hunts = current_user.hunts
      hunts.each do |hunt|
        hunt.current_hunt = false
        if hunt.monument.id == monuments[0].id
          hunt.current_hunt = true
          hunt_already_exist = true
          hunt.progress = 1
          actual_hunt = hunt
        end
        hunt.save
      end
      actual_hunt = Hunt.create(current_hunt: true, progress: 1, monument: monuments[0], user: current_user) unless hunt_already_exist
      redirect_to monument_path(monuments[0])
    end
  end

  def show
    @hunt = Hunt.where(user_id: current_user, monument_id: params[:monument_id]).first
    @score = count_score(@hunt)
    @hunt.progress = 3
  end

  private

  def count_score(hunt)
    choices = hunt.choices
    count = 0
    choices.each { |choice| count += 1 if choice.success == true }
    return count
  end

end
