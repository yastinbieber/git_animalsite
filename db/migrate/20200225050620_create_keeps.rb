class CreateKeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :keeps do |t|
      t.string :user_id
      t.datetime :date
      t.string :area
      t.string :kind
      t.string :color
      t.text :details
      t.string :gender
      t.string :size
      t.string :collar
      t.text :text
      t.string :image
      t.timestamps null:true
    end
  end
end
