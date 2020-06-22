class CreateDifferences < ActiveRecord::Migration[5.2]
  def change
    create_table :differences do |t|
      t.float :total
      t.boolean :sunday, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
