class QuestionDecorator < Draper::Decorator
  delegate_all

  def formatted_created_at
    created_at.strftime('%b %d, %Y')
  end
end
