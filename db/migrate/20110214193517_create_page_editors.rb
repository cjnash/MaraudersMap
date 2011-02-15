class CreatePageEditors < ActiveRecord::Migration  
  def self.up
    create_table :page_editors do |t|
      t.integer :user_id
      t.integer :page_id

      t.timestamps
    end
  end

  def self.down
    drop_table :page_editors
  end
end
