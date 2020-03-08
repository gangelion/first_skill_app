class Message < ApplicationRecord
  belongs_to :user
  belongs_to :mentee, class_name: 'User'
  
  validates :content, presence: true, length: { maximum: 2000 }
end
