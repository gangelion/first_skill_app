class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 80 }
  validates :content, presence: true, length: { maximum: 2000 }
end
