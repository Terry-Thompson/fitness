class AddUsersToTriceps < ActiveRecord::Migration
  def change
    add_column :triceps, :user_id, :integer
  end
end
