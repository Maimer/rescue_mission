class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def new

  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      flash.now[:notice] = "Your question was not succesfully submitted."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
