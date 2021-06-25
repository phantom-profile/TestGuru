# frozen_string_literal: true

module QuestionsHelper
  def question_header(test)
    action = if @question.new_record?
               'Create'
             else
               'Edit'
             end
    "#{action} #{test.title} question"
  end
end
