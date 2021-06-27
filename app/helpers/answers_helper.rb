# frozen_string_literal: true

module AnswersHelper
  def answer_header(answer)
    action = if answer.new_record?
               'Create'
             else
               'Edit'
             end
    "#{action} answer for ''#{answer.question.body}'' question"
  end
end
