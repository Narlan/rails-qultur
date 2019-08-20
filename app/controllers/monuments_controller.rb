class MonumentsController < ApplicationController
  def index
    @monuments = Monument.geocoded # returns monuments with coordinates

    @markers = @monuments.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { monument: monument }),
      }
    end


    @monuments = Monument.near(params[:query][:address], 30)
    @marker = markers
    if @marker.empty?
      @monuments = Monument.all
      @marker = markers
    end
  end

  def show
    @monument = Monument.find(params[:id])
  end
end
