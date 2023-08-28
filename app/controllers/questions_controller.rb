class QuestionsController < ApplicationController
  # localhost/questons 
  def index
    @questions = Question.all
  end
end
