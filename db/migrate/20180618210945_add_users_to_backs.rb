class AddUsersToBacks < ActiveRecord::Migration
  def change
    add_column :backs, :user_id, :integer
  end
end
