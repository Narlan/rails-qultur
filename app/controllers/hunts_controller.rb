class HuntsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[scanned]

  def create
    hunt = Hunt.new
  end

  def scanned
    monuments = Monument.where("qrcode = '#{params[:url]}'")
    if monuments.length > 0
      raise
    else
      raise
    end
  end

end
