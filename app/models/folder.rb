class Folder < ActiveRecord::Base
  
  belongs_to :parent_folder, :class_name => 'Folder', :foreign_key => :folder_id
  has_many :folders, :dependent => :destroy
  has_many :assets
  has_many :section_assets
  has_many :sections, :through => :section_assets
  
  def directory
    File.basename(path)
  end
  
end