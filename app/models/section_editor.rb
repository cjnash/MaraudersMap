class SectionEditor < ActiveRecord::Base
  belongs_to :section
  belongs_to :user
end