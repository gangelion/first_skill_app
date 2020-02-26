class Mentor < ApplicationRecord
  has_many :user_mentors
  has_many :users, through: :user_mentors
end
