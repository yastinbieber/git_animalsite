class CreateLocatecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :locatecomments do |t|
      t.integer :user_id
      t.integer :locate_id
      t.text :text
      t.timestamps
    end
  end
end
