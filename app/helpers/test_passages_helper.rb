# frozen_string_literal: true

module TestPassagesHelper
  def result_of(test_passage)
    success = test_passage.successful? ? 'successfully' : 'unsuccessfully'
    result = test_passage.result.to_i
    answer = "Test was completed #{success}. #{result}% of answers correct"
    answer += ' Time runs out' if test_passage.time_runs_out
    answer
  end
end
