class AddCreateDateAndCmsurlToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :cms_url, :string
    add_column :pages, :cms_created_at, :datetime
  end

  def self.down
    remove_column :pages, :cms_url
    remove_column :pages, :cms_created_at
  end
end
