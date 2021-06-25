# frozen_string_literal: true

module TestsHelper
  def test_header
    if @test.new_record?
      'Create new test'
    else
      "Edit test \"#{@test.title}\""
    end
  end
end
