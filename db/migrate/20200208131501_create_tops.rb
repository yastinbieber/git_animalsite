class CreateTops < ActiveRecord::Migration[5.2]
  def change
    create_table :tops do |t|
      t.string :name
      t.string :email
      t.integer :user_id
      t.timestamps null: true
    end
  end
end
