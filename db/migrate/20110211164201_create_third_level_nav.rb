class CreateThirdLevelNav < ActiveRecord::Migration
  def self.up
    create_table :third_level_navs do |t|
      t.string :name
      t.integer :cms_page_id
      t.integer :second_level_nav_id
      t.string :url
      t.boolean :online
      
      t.timestamps
    end
  end

  def self.down
    drop_table :third_level_navs
  end
end
