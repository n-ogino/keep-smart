class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.float :weight
      t.integer :day
      t.integer :user_id
      t.integer :difference_id
      t.timestamps
    end
  end
end
