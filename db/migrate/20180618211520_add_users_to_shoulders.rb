class AddUsersToShoulders < ActiveRecord::Migration
  def change
    add_column :shoulders, :user_id, :integer
  end
end
