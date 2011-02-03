class Page < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  
  validates :headline, :presence => true
  validates :cms_page_id, :presence => true, :uniqueness => true
  validates :status, :presence => true
  validates :section, :presence => true
  validates :path, :presence => true
  validates :url, :presence => true
  validates :reviewed_by, :presence => true
  validates :reviewed_date, :presence => true
  validates :user_state, :presence => true
  validates :template, :presence => true
  validates :next_review_date, :presence => true

  def self.live
    self.where(:status => "Live!")
  end
    
  def self.offline
    self.where(:status => "Offline")
  end
  
  def self.membership
    self.where(:section => "Membership")
  end
  
  def self.travel
    self.where(:section => "Travel")
  end
  
  def self.auto
    self.where(:section => "Auto")
  end
  
  def self.registries
    self.where(:section => "Registries")
  end
  
  def self.insurance
    self.where(:section => "Insurance")
  end
  
  def self.deals
    self.where(:section => "Deals")
  end
  
  def self.drivered
    self.where(:section => "Driver Ed")
  end
  
  def self.financial
    self.where(:section => "Financial*")
  end
  
  def self.communityandama
    self.where(:section => "Community & AMA")
  end
  
  def self.other
    self.where(:section => "Other")
  end
  
  def self.christopher
    self.where(:created_by => "Christopher.Nash")
  end
  
  def self.amanda
    self.where(:created_by => "Amanda.Doucette")
  end
  
  def self.laura
    self.where(:created_by => "Laura.Urbanowski")
  end
  
  def self.krista
    self.where(:created_by => "Krista.Vieira")
  end
  
  def self.jason
    self.where(:created_by => "Jason.Buzzell")
  end
  
  def self.johnn
    self.where(:created_by => "Johnn.Four")
  end
  
  def self.darrell
    self.where(:created_by => "Darrell.Winwood")
  end
  
  def self.ruthann
    self.where(:created_by => "RuthAnn.Raycroft")
  end
  
  def self.dwain
    self.where(:created_by => "Dwain.SagerWilson")
  end
  
  def self.esci
    self.where(:created_by => "Esci.Cagaoan")
  end
  
  def self.sarahvt
    self.where(:created_by => "Sarah.VanTassel")
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['cms_page_id LIKE ?', "#{search}"])
    else
      find(:all)
    end
  end
  
  # Haven't figured out how to use this kind of filtering yet for dropdowns, so I've kept this here but commented it out. The selects are done in the view.
 # STATUS = ["Live!", "Offline"]
 # SECTIONS = ["Membership", "Travel", "Auto", "Registries", "Insurance", "Driver Ed", "Financial**", "AMA & Community", "Other"]
 # USERS = ["Amanda", "Christopher", "Darrell", "Dwain", "Esci", "Krista", "Jason", "Johnn", "RuthAnn", "Sarah vT", "Other"]
  
end
