class QuestionsController < ApplicationController
  before_action :set_monument, only: %i[new create show next_question]

  def show
    @question = Question.find(params[:id])
    @randoms = [0, 1, 2, 3].shuffle
    @next_question = Question.find_by(position: @question.position + 1, monument: @question.monument)
    @hunt = Hunt.where(user_id: current_user, monument_id: @question.monument).first
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.monument = @monument
    if @question.save
      redirect_to monument_questions_path
    else
      render :new
    end
  end

  private

  def set_monument
    @monument = Monument.find(params[:monument_id])
  end

  def question_params
    params.require(:question).permit(:title, :position)
  end
end
