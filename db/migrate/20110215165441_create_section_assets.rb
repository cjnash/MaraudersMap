class CreateSectionAssets < ActiveRecord::Migration
  def self.up
    create_table :section_assets do |t|
      t.integer :folder_id
      t.integer :section_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :section_assets
  end
end
