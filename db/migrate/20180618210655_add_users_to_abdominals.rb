class AddUsersToAbdominals < ActiveRecord::Migration
  def change
    add_column :abdominals, :user_id, :integer
  end
end
