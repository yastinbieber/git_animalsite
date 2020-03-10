class CreateKeepcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :keepcomments do |t|
      t.integer :user_id
      t.integer :keep_id
      t.text :text
      t.timestamps
    end
  end
end
