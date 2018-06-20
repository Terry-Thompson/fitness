class AddUsersToChests < ActiveRecord::Migration
  def change
    add_column :chests, :user_id, :integer
  end
end
