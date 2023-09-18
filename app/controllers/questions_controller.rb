class QuestionsController < ApplicationController
  # localhost/questons
  before_action :set_question!, only: %i[show edit update destroy]

  def index
    @questions = Question.order(created_at: 'DESC').page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = question_params

    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'Question created!'
      # flash[:expires] = Time.now + 5.seconds
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    # if @question.update(params[:id])
    #   redirect_to questions_path
    #   flash[:notice] = "Question updated"
    # else
    #   render :edit
    # end
  end

  def update
    if @question.update(question_params)
      flash[:success] = "Question updated!"
      redirect_to questions_path
      # flash[:notice] = 'Question updated'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted!"
    redirect_to questions_path
  end

  def show
    @answer = @question.answers.build
    # 3 способа:
    @answers = @question.answers.order(created_at: 'DESC')
    # @answers = Answer.where(question_id: params[:id]).order created_at: 'DESC'
    # @answers = Answer.where(question: @question).order created_at: 'DESC'
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
