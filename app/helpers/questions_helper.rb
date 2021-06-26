# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    action = if question.new_record?
               'Create'
             else
               'Edit'
             end
    "#{action} #{question.test.title} question"
  end
end
