# frozen_string_literal: true

module QuestionsHelper
  def question_header(test)
    action = if action_name == 'new'
               'Create'
             else
               'Edit'
             end
    "#{action} #{test.title} question"
  end
end
