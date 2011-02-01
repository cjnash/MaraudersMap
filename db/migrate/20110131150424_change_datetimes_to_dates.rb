class ChangeDatetimesToDates < ActiveRecord::Migration
  def self.up
    change_column :pages, :reviewed_date, :date
    change_column :pages, :created_at, :date
    change_column :pages, :updated_at, :date
  end

  def self.down
    change_column :pages, :reviewed_date, :datetime
    change_column :pages, :created_at, :datetime
    change_column :pages, :updated_at, :datetime
  end
end
s