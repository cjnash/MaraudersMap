class Asset < ActiveRecord::Base
  belongs_to :folder
  has_many :notes
  
  scope :pdfs, where (:file_type => '.pdf')
  scope :images, where ("file_type != '.pdf'")
end
