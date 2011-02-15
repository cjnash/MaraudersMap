class Section < ActiveRecord::Base
  
  has_many :pages
  has_many :second_level_navs
  has_many :section_editors
  has_many :users, :through => :section_editors
  has_many :section_assets
  has_many :folders, :through => :section_assets

  def menu_meta
    YAML.load_file(File.join('content',self.path,'menu.yaml'))
  end
  
end