# frozen_string_literal: true

class TestsUser < ApplicationRecord
  has_many :tests
  has_many :users
end
