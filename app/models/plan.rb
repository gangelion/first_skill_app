class Plan < ApplicationRecord
  has_many :users_plans
  has_many :users, through: :users_plans
  belongs_to :user
  has_many :plan_skill_tags, dependent: :delete_all
  has_many :skills, through: :plan_skill_tags
end
