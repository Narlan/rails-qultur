class MonumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  # def init_markers
  #   @monuments.map do |monument|
  #     {
  #       lat: monument.latitude,
  #       lng: monument.longitude,
  #       infoWindow: render_to_string(partial: "info_window", locals: { cat: monument }),
  #       image_url: helpers.asset_url('coin.png')
  #     }
  #   end
  # end

  def index
    hunts = current_user.hunts
    @monuments = []
    hunts.each { |hunt| @monuments << hunt.monument if hunt.score > 4 }
  end

  def show
    @monument = Monument.find(params[:id])
  end
end
