class AddOnlineStatusAndRelationshipsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :online, :boolean
    add_column :pages, :section_id, :integer
    add_column :pages, :second_level_nav_id, :integer
    add_column :pages, :third_level_nav_id, :integer
    add_column :pages, :page_type, :string
    add_column :pages, :file_name, :string
    add_column :pages, :published_date, :datetime
    remove_column :pages, :url
    remove_column :pages, :path
    remove_column :pages, :section
    remove_column :pages, :status
    remove_column :pages, :headline
  end

  def self.down
    remove_column :pages, :online
    remove_column :pages, :section_id
    remove_column :pages, :second_level_nav_id
    remove_column :pages, :third_level_nav_id
    remove_column :pages, :page_type
    remove_column :pages, :file_name
    remove_column :pages, :published_date
    add_column :pages, :url, :string
    add_column :pages, :path, :string
    add_column :pages, :section, :string
    add_column :pages, :status, :string
    add_column :pages, :headline, :string
  end
end
