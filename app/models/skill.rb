class Skill < ApplicationRecord
  has_many :plan_skill_tags, dependent: :delete_all
  has_many :plans, through: :plan_skill_tags
end
