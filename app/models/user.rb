class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image_icon, ImageUploader
  
  has_many :users_plans, dependent: :delete_all
  has_many :plans, through: :users_plans
  has_many :plans, dependent: :destroy
  has_many :relationships, dependent: :delete_all
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :delete_all
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :messages, dependent: :delete_all
  has_many :replymessages, class_name: 'Message', foreign_key: 'sender_id', dependent: :delete_all
  has_many :articles, dependent: :delete_all
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :introduce, length: { maximum: 500 }

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
end
