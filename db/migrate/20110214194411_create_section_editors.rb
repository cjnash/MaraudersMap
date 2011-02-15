class CreateSectionEditors < ActiveRecord::Migration
  def self.up
    create_table :section_editors do |t|
      t.integer :user_id
      t.integer :section_id

      t.timestamps
    end
  end

  def self.down
    drop_table :section_editors
  end
end
