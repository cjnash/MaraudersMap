class AddDeeplinksEtc < ActiveRecord::Migration
  def self.up
    add_column :pages, :deep_link, :string
    add_column :pages, :user_state, :string
    add_column :pages, :template, :string
    add_column :pages, :next_review_date, :date
  end

  def self.down
    remove_column :pages, :deep_link, :string
    remove_column :pages, :user_state, :string
    remove_column :pages, :template, :string
    remove_column :pages, :next_review_date, :date
  end
end
