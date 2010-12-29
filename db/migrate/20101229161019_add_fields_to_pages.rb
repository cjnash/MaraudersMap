class AddFieldsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :headline, :string
    add_column :pages, :cms_page_id, :integer
    add_column :pages, :section, :string
    add_column :pages, :path, :string
    add_column :pages, :url, :string
    add_column :pages, :created_by, :string
    add_column :pages, :updated_by, :string
    add_column :pages, :reviewed_by, :string
    add_column :pages, :reviewed_date, :datetime
  end

  def self.down
    remove_column :pages, :headline
    remove_column :pages, :cms_page_id
    remove_column :pages, :section
    remove_column :pages, :path
    remove_column :pages, :url
    remove_column :pages, :created_by
    remove_column :pages, :updated_by
    remove_column :pages, :reviewed_by
    remove_column :pages, :reviewed_date
  end
end
