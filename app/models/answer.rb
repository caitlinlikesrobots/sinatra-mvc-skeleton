class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable
end
