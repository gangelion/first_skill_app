class Plan < ApplicationRecord
  mount_uploader :plan_image, ImageUploader

  has_many :users_plans, dependent: :delete_all
  has_many :users, through: :users_plans
  belongs_to :user
  has_many :plan_skill_tags, dependent: :delete_all
  has_many :skills, through: :plan_skill_tags

  accepts_nested_attributes_for :users_plans, allow_destroy: true

  validates :title, presence: true, length: { in: 10..80 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :price, presence: true

end
