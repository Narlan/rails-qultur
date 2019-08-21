class HuntsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:scanned]

  def create
    hunt = Hunt.new
  end

  def scanned
    monuments = Monument.where("qrcode = '#{params[:url]}'")
    Hunt.create(current_hunt: true, score: 0, progress: "scanned", monument: monuments[0], user: current_user) unless monuments.empty?
  end
end
