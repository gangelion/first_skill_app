class CreateUserMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_mentors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true
      t.timestamps
    end
  end
end