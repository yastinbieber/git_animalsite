class AddTextsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :texts, :text
  end
end
