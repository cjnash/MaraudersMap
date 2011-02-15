class Page < ActiveRecord::Base
  has_many :page_editors
  has_many :users, :through => :page_editors
  belongs_to :section
  belongs_to :second_level_nav
  belongs_to :third_level_nav
  has_many :notes
  has_one :metadata
  
  scope :by_name, lambda {
    joins(:metadata).
    order('metadatas.content_title')
  }
  
#  validates :headline, :presence => true
  validates :cms_page_id, :presence => true, :uniqueness => true
#  validates :status, :presence => true
#  validates :section, :presence => true
#  validates :path, :presence => true
#  validates :url, :presence => true
#  validates :reviewed_by, :presence => true
#  validates :reviewed_date, :presence => true
#  validates :user_state, :presence => true
#  validates :template, :presence => true
#  validates :next_review_date, :presence => true
  
  def url
    "#{self.path}/#{self.base_file_name}"
  end
  
  def path
    self.section.path
  end
  
  def base_file_name
    base_file_name = File.basename(self.file_name, File.extname(self.file_name))
    File.basename(base_file_name, File.extname(base_file_name))
  end
  
  def second_level?
    return !third_level? && self.metadata.nav2.present?
  end
  
  def third_level?
    return self.metadata.nav3.present?
  end
  
  def status
    self.online? ? "Live!" : "Offline"
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['cms_page_id LIKE ?', "#{search}"])
    else
      find(:all)
    end
  end
  
end
