class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.string :plan_image, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
