class AnswersController < ApplicationController
  def index

  end

  def new

  end

  def create
    @question = Question.find(params[:question_id])

    @answer = Answer.new(answer_params)

    @answer.question = @question

    if @answer.save
      redirect_to "/questions/#{@question.id}"
    else
      flash.now[:notice] = "Your answer was not succesfully submitted."
      redirect_to "/questions/#{@question.id}"
    end
  end

  def show

  end

  private

  def answer_params
    params.require(:answer).permit(:description, :user_id)
  end
end
