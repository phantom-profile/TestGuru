# frozen_string_literal: true

module TestPassagesHelper
  def result_of(test_passage)
    success = if test_passage.successful?
                'successfully'
              else
                'unsuccessfully'
              end
    result = test_passage.result.to_i
    "Test was completed #{success}. #{result}% of answers correct"
  end

  def question_number(question, questions)
    questions.to_a.index(question) + 1
  end
end
