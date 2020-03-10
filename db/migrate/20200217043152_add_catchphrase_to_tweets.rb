class AddCatchphraseToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :catchphrase, :text
  end
end
