class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :name
      t.text :image
      t.text :text
      t.timestamps null: true
    end
  end
end
