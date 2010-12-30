class Page < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  
  validates :headline, :presence => true
  validates :cms_page_id, :presence => true
  validates :status, :presence => true
  validates :section, :presence => true
  validates :path, :presence => true
  
  STATUS = ["Live!", "Offline"]
  SECTIONS = ["Membership", "Travel", "Auto", "Registries", "Insurance", "Driver Ed", "Financial**", "AMA & Community", "Other"]
  USERS = ["Amanda", "Christopher", "Darrell", "Dwain", "Esci", "Krista", "Jason", "Johnn", "RuthAnn", "Sarah vT", "Other"]
  
end
