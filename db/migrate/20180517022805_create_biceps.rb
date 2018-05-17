class CreateBiceps < ActiveRecord::Migration
  def change
    create_table :biceps do |t|
      t.string :exercise_name
      t.string :description
      t.integer :repetitions
      t.string :weight
      t.timestamps null: false
    end
  end
end
