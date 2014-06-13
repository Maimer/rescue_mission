class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
    @question = Question.new
  end

  def new

  end

  def create
    @question = Question.new(question_params)

    @question.user_id = session[:user_id]

    if @question.save
      redirect_to @question
    else
      flash.now[:notice] = "Your question was not succesfully submitted."
      redirect_to @question
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
