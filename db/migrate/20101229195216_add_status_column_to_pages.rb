class AddStatusColumnToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :status, :string
  end

  def self.down
    drop_column :pages, :status
  end
end
