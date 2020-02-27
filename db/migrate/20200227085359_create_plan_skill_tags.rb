class CreatePlanSkillTags < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_skill_tags do |t|
      t.references :plan
      t.references :skill
      t.timestamps
    end
  end
end
