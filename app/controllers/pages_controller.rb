class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @monuments = Monument.all
    if params[:query] && params[:query][:address]
      @monuments = @monuments.near(params[:query][:address], 30)
    end
    @markers = @monuments.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude,
        infoWindow: render_to_string(partial: "monuments/info_window", locals: { monument: monument }),
        image_url: helpers.asset_url('coin.png')
      }
    end
  end
end



# class PagesController < ApplicationController
#   skip_before_action :authenticate_user!, only: [:home]

#   def home
#     if params[:query] && params[:query][:city] == ""
#       @monuments = Monument.all
#       @marker = markers
#     else
#       results = Geocoder.search(params[:query][:city])
#       @result = results.first.coordinates
#       @monuments = Monument.all
#       @marker = markers
#         if @marker.empty?
#           @monuments = Monument.all
#           @marker = markers
#         end
#     end
#   end

#   def markers
#     @markers = @monuments.map do |monument|
#       {
#         lat: monument.latitude,
#         lng: monument.longitude,
#         infoWindow: render_to_string(partial: "monuments/info_window", locals: { monument: monument }),
#         image_url: helpers.asset_url('coin.png')
#       }
#     end
#     return @markers
#   end
# end

