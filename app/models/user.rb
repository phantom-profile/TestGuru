# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :validatable,
         :rememberable,
         :confirmable

  has_many :written_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates_presence_of :firstname, :lastname, :username
  validates_uniqueness_of :username
  validates :email, presence: true,
                    uniqueness: true,
                    format: URI::MailTo::EMAIL_REGEXP
  
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
