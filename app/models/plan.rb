class Plan < ApplicationRecord
  mount_uploader :plan_image, ImageUploader

  has_many :users_plans, dependent: :delete_all
  has_many :users, through: :users_plans
  belongs_to :user
  has_many :plan_skill_tags, dependent: :delete_all
  has_many :skills, through: :plan_skill_tags

  accepts_nested_attributes_for :users_plans, allow_destroy: true
  accepts_nested_attributes_for :skills, allow_destroy: true

  validates :title, presence: true, length: { in: 10..80 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :price, presence: true

  before_save :find_or_create_skill

  private
    def find_or_create_skill
      self.skills = self.skills.map {|skill| Skill.find_or_create_by(skill_set: skill.skill_set.strip)}
    end

end
