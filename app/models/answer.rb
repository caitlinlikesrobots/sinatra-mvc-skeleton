require_relative 'vote_count_module'
class Answer < ActiveRecord::Base
  include VoteCount

  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :content, presence: true
  validates :content, length: {minimum: 2}
  validates :content, length: {maximum: 750}


end
