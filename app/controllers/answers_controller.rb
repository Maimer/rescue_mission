class AnswersController < ApplicationController
  def index

  end

  def new

  end

  def create
    @question = Question.find(params[:question_id])

    @answer = Answer.new(answer_params)

    @answer.question = @question

    @answer.user_id = session[:user_id]

    if @answer.save
      redirect_to "/questions/#{@question.id}"
    else
      flash.now[:notice] = "Your answer was not succesfully submitted."
      redirect_to "/questions/#{@question.id}"
    end
  end

  def show

  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer.update(best: true)

    redirect_to question_path(@question), method: :patch
  end

  def update

  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
