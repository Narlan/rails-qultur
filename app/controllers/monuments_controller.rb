class MonumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if user_signed_in?
      hunts = current_user.hunts.where.not(progress: 'pending')
      @captured_monuments = []
      hunts.each { |hunt| @captured_monuments << hunt.monument if hunt.score >= 5 }
      @visited_monuments = []
      hunts.each { |hunt| @visited_monuments << hunt.monument if hunt.score < 5 }
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @monument = Monument.find(params[:id])
    current_user.hunts.each do |hunt|
      @hunt = hunt if @monument.id == hunt.monument_id
    end
  end
end
