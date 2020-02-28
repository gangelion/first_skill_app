class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :plans
  has_many :users_plans
  # has_many :buy_plans, through: :users_plans, source: :plan
  
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :introduce, length: { maximum: 500 }
end
