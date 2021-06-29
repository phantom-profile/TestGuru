# frozen_string_literal: true

class User < ApplicationRecord

  has_many :written_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates_presence_of :firstname, :lastname, :username
  validates_uniqueness_of :username
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  scope :completed_tests, ->(level) { tests.where(level: level) }

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
