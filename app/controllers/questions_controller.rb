class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:monument_id])
  end

  def new
    @question = Question.new
  end

  def create
    @monument = Monument.find(params[:monument_id])
    @question = Question.new(question_params)
    @question.monument = @monument
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :position)
  end
end
