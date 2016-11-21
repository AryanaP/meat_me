class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.references :meal, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.text :user_comment

      t.timestamps
    end
  end
end
