class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :username
    
  devise :database_authenticatable, :lockable, :timeoutable, :trackable, :validatable
  
  has_many :page_editors
  has_many :pages, :through => :page_editors
  has_many :section_editors
  has_many :sections, :through => :section_editors
  has_one :dashboard, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  
end
