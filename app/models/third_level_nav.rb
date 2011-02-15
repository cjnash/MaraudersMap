class ThirdLevelNav < ActiveRecord::Base
  
  has_one :page
  has_many :hidden_pages, :class_name => 'Page', :foreign_key => :third_level_nav_id
  belongs_to :second_level_nav
  
  def direct_link?(url)
    return self.url == url
  end
  
  def link
    (url.include?('http:') || url.include?('https:'))? url : "#{SITE_URL}/#{url}"
  end
  
  def hidden_pages?
    return hidden_pages.size > 0
  end
  
end