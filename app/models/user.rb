class User < ActiveRecord::Base
    
  def self.authenticate!(username, password)
    find_by_username_and_password(username, password)    
  end
  
  has_many :page_editors
  has_many :pages, :through => :page_editors
  has_many :section_editors
  has_many :sections, :through => :section_editors
  
end
