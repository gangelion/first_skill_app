class Plan < ApplicationRecord
  has_many :users_plans
  has_many :users, through: :users_plans
  belongs_to :user
end
