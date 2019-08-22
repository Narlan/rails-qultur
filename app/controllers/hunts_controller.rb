class HuntsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:scanned]

  def create
    if user_signed_in?
      hunt_already_exist = false
      monument = Monument.find(params[:format])
      hunts = current_user.hunts
      hunts.each do |hunt|
        hunt.current_hunt = false
        if hunt.monument.id == monument.id
          hunt.current_hunt = true
          hunt_already_exist = true
        end
        hunt.save
      end
      Hunt.create(current_hunt: true, score: 0, progress: "pending", monument: monument, user: current_user) unless hunt_already_exist
      redirect_to monument_path(monument)
    else
      redirect_to new_user_session_path
    end
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
          hunt.progress = 'scanned'
          actual_hunt = hunt
        end
        hunt.save
      end
      actual_hunt = Hunt.create(current_hunt: true, score: 0, progress: "pending", monument: monuments[0], user: current_user) unless hunt_already_exist
      redirect_to monument_path(monuments[0])
    end
  end

  def show
    @hunt = Hunt.find(params[:id])
  end

end
