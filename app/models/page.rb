class Page < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  
  validates :headline, :presence => true
  validates :cms_page_id, :presence => true
  validates :status, :presence => true
  validates :section, :presence => true
  validates :path, :presence => true
  validates :url, :presence => true
  validates :reviewed_by, :presence => true
  validates :reviewed_date, :presence => true

  def self.live
    self.where(:status => "Live!")
  end
    
  def self.offline
    self.where(:status => "Offline")
  end
  
  # Haven't figured out how to use this kind of filtering yet for dropdowns, so I've kept this here but commented it out. The selects are done in the view.
 # STATUS = ["Live!", "Offline"]
 # SECTIONS = ["Membership", "Travel", "Auto", "Registries", "Insurance", "Driver Ed", "Financial**", "AMA & Community", "Other"]
 # USERS = ["Amanda", "Christopher", "Darrell", "Dwain", "Esci", "Krista", "Jason", "Johnn", "RuthAnn", "Sarah vT", "Other"]
  
end
