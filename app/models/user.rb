class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image_icon, ImageUploader
  
  has_many :plans, dependent: :delete_all
  has_many :users_plans, dependent: :delete_all
  # has_many :buy_plans, through: :users_plans, source: :plan
  
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :introduce, length: { maximum: 500 }
end
