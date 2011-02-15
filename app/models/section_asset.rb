class SectionAsset < ActiveRecord::Base
  
  belongs_to :section
  belongs_to :folder

end