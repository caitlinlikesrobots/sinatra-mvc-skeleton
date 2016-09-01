class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :answers

  validates :title, :content, presence: true
  validates :title, length: {minimum: 2}, length: {maximum: 50}
  validates :content, length: {minimum: 2}, length: {maximum: 750}
end
