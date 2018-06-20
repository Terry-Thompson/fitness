class AddUsersToBiceps < ActiveRecord::Migration
  def change
    add_column :biceps, :user_id, :integer
  end
end
