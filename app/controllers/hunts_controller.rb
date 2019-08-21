class HuntsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[scanned]

  def scanned
    raise
  end

end
