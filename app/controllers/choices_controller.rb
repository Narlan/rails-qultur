class ChoicesController < ApplicationController

  def create
    @notice = "COUCOU"
    question = Question.find(params[:question_id])
    answer = question.answers[0]
    current_hunt = current_user.hunts.select { |hunt| hunt.current_hunt == true}
    current_hunt = current_hunt.first
    choice = Choice.create(hunt: current_hunt, success: params[:success], answer: answer)
    next_question = Question.find_by(position: question.position + 1, monument: question.monument)
    if next_question != nil
      redirect_to monument_question_path(question.monument, next_question)
    else
      redirect_to monument_hunt_path(monument_id: question.monument, id: current_hunt)
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:success)
  end
end
