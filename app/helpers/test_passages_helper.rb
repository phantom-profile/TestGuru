# frozen_string_literal: true

module TestPassagesHelper
  def percent_result(test_passage)
    result = (test_passage.correct_questions.to_f / test_passage.test.questions.count * 100)
    if result >= 85
      success = 'successfully'
      color = 'green'
    else
      success = 'unsuccessfully'
      color = 'red'
    end
    "<font color='#{color}'> Test was completed #{success}. #{result.to_i}% or answers correct </font>".html_safe
  end

  def question_number(question, questions)
    questions.to_a.index(question) + 1
  end
end
