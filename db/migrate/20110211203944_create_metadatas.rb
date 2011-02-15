class CreateMetadatas < ActiveRecord::Migration
  
  def self.up
    create_table :metadatas do |t|
      t.integer :page_id
      t.string :author
      t.string :editor
      t.string :browser_title
      t.string :content_title
      t.integer :nav2
      t.integer :nav3
      t.string :keywords
      t.string :description
      t.boolean :online

      t.timestamps
    end
  end

  def self.down
    drop_table :metadatas
  end
  
end
