class Page < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  validates :headline, :presence => true
  validates :cms_page_id, :presence => true
  validates :section, :presence => true
  validates :path, :presence => true
end
