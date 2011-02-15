class CreateSection < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name
      t.string :path
      t.boolean :online
      
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
