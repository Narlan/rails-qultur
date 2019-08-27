class MonumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if user_signed_in?
      hunts = current_user.hunts
      @captured_monuments = []
      @visited_monuments = []
      hunts.each do |hunt|
        if captured?(hunt)
          @captured_monuments << hunt.monument
        elsif !captured?(hunt) && hunt.progress > 0
          @visited_monuments << hunt.monument
        end
      end
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

  private

  def captured?(hunt)
    choices = hunt.choices
    hunt.score = 0
    choices.each { |choice| hunt.score += 1 if choice.success == true }
    hunt.score > 4
  end
end
