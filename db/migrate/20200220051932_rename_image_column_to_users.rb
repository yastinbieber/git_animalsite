class RenameImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Image, :image
  end
end
