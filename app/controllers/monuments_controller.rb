class MonumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    hunts = current_user.hunts
    @monuments = []
    hunts.each { |hunt| @monuments << hunt.monument if hunt.score > 4 }
  end

  def show
    @monument = Monument.find(params[:id])
  end
end
