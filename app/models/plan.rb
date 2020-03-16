class Plan < ApplicationRecord
  mount_uploader :plan_image, ImageUploader

  has_many :users_plans, dependent: :delete_all
  has_many :users, through: :users_plans
  belongs_to :user
  has_many :plan_skill_tags, dependent: :delete_all
  has_many :skills, through: :plan_skill_tags

  accepts_nested_attributes_for :users_plans, allow_destroy: true
  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: proc { |att| att[:skill_set].blank?}

  validates :title, presence: true, length: { in: 10..80 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 1000000 }

  before_save :find_or_create_skill

  private
  def find_or_create_skill
    skill_array = []
    self.skills.map { |skill|
      skill.skill_set.strip.split(",").each do |skill_set|
        skill_array << skill_set
      end  
    }
    self.skills.destroy_all
    skill_array.each do |skill|
      self.skills << Skill.find_or_create_by(skill_set: skill)
    end
  end

  def self.search(keyword)
    if keyword && keyword != ""
      words = keyword.to_s.split(/[[:blank:]]+/)
      columns = ["title", "description", "skill_set"]
      query = []
      result = []
 
      columns.each do |column|
        query << ["#{column} LIKE ?"]
      end
 
      words.each_with_index do |w, index|
        if index == 0
          result[index] = Plan.eager_load(:skills).where([query.join(" OR "), "%#{w}%",  "%#{w}%", "%#{w}%"])
        else
          result[index] = result[index-1].where([query.join(" OR "), "%#{w}%",  "%#{w}%", "%#{w}%"])
        end
      end
      return result[words.length-1]
    else
      Plan.all
    end
  end

end
