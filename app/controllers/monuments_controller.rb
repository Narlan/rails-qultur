class MonumentsController < ApplicationController
  def index
    @flats = Flat.geocoded # returns monuments with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
