class AddLocateIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :locate_id, :integer
  end
end
