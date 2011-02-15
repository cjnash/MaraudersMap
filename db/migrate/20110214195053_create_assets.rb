class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :file_name
      t.string :file_type
      t.datetime :published_date
      t.integer :size
      t.integer :folder_id
      t.boolean :online
      
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
