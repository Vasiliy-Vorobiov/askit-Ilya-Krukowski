class QuestionsController < ApplicationController
  # localhost/questons 

  def index
    @questions = Question.all
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
    @question = Question.find_by id: params[:id]

    # if @question.update(params[:id])
    #   redirect_to questions_path
    #   flash[:notice] = "Question updated"
    # else
    #   render :edit
    # end
  end

  def update
    @question = Question.find_by id: params[:id]
    if @question.update(question_params)
      flash[:success] = "Question updated!"
      redirect_to questions_path
      # flash[:notice] = 'Question updated'
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    flash[:success] = "Question deleted!"
    redirect_to questions_path
  end

  def show
    @question = Question.find_by id: params[:id]
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
