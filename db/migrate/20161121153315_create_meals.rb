class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :address
      t.string :city
      t.date :date
      t.text :description
      t.string :food_type
      t.string :meeting_type
      t.integer :price

      t.timestamps
    end
  end
end
