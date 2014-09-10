class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.integer :user_id
      t.integer :widget_id
      t.timestamps
    end

    add_index :buckets, [:user_id, :widget_id], :unique => true

  end
end
