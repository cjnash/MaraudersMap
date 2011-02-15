class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.string :path
      t.integer :folder_id
      t.boolean :online

      t.timestamps
    end
  end

  def self.down
    drop_table :folders
  end
end
