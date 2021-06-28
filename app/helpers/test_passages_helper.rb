# frozen_string_literal: true

module TestPassagesHelper
  def percent_result(test_passage)
    if test_passage.successful?
      success = 'successfully'
      color = 'green'
    else
      success = 'unsuccessfully'
      color = 'red'
    end
    result = test_passage.result.to_i
    "<font color='#{color}'> Test was completed #{success}. #{result}% of answers correct</font>".html_safe
  end

  def question_number(question, questions)
    questions.to_a.index(question) + 1
  end
end
