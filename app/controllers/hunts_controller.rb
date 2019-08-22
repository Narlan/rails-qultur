class HuntsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:scanned]

  def create
    hunt_already_exist = false
    monument = Monument.find(params[:format])
    hunts = current_user.hunts
    hunts.each do |hunt|
      hunt.current_hunt = false
      if hunt.monument.id == monument.id
        hunt.current_hunt = true
        hunt_already_exist = true
      end
    end
    Hunt.create(current_hunt: true, score: 0, progress: "pending", monument: monument, user: current_user) unless hunt_already_exist
    redirect_to monument_path(monument)
  end

  def scanned
    monuments = Monument.where("qrcode = '#{params[:url]}'")
    Hunt.create(current_hunt: true, score: 0, progress: "scanned", monument: monuments[0], user: current_user) unless monuments.empty?
    redirect_to monument_path(monuments[0])
  end

  def results
  end

end
