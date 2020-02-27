class PlanSkillTag < ApplicationRecord
  belongs_to :plan
  belongs_to :skill
end
