# frozen_string_literal: true

class Gist < ApplicationRecord
  scope :created_at_by_desc, -> { order(created_at: :desc) }
end
