class QuestionsController < ApplicationController
  before_action :set_monument, only: %i[new create]

  def index
    @questions = Question.all.where(monument: params[:monument_id])
  end

  def show
    @questions = Question.all.where(monument: params[:monument_id])
    @randoms = [0, 1, 2, 3].shuffle
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
