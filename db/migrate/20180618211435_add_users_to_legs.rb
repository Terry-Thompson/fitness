class AddUsersToLegs < ActiveRecord::Migration
  def change
    add_column :legs, :user_id, :integer
  end
end
