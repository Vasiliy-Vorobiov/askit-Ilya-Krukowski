class AnswersController < ApplicationController
  include ActionView::RecordIdentifer

  before_action :set_question!
  before_action :set_answer!, except: :create

  def update
    if @answer.update(answer_params)
      flash[:success] = "Answer updated!"
      redirect_to question_path(@question, anchor: dom_id(@answer))
      # flash[:notice] = 'Question updated'
    else
      render :edit
    end
  end

  def edit
  end

  def create
    # render plain: params
    @answer = @question.answers.build(answer_params)
    if @answer.save
      flash[:success] = "Answer saved!"
      redirect_to question_path(@question)
    else
      @answers = @question.answers.order(created_at: 'DESC')
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = "Answer deleted!"
    redirect_to question_path(@question)
  end

  private

  def set_question!
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_answer!
    @answer = @question.answers.find(params[:id])
  end
end
