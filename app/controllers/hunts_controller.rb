class HuntsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[scanned]

  def create
    hunt = Hunt.new
  end

  def scanned
    raise
  end

end
