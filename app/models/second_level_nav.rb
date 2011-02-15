class SecondLevelNav < ActiveRecord::Base
  
  belongs_to :section 
  has_one :page
  has_many :third_level_navs
  
  def third_level_nav?
    return third_level_navs.size > 0
  end
  
  def link
    (url.include?('http:') || url.include?('https:'))? url : "#{SITE_URL}/#{url}"
  end
  
end