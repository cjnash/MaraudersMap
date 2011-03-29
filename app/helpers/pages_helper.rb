module PagesHelper
  
  def section_link
    @page.section.present? ? (link_to @page.section.name, section_path(@page.section)) : "Unknown"
  end
  
  def pretty_date(date)
    date.strftime('%d %b %Y at %I:%M %p') if date
  end
  
  def to_csv
    FasterCSV.generate(:col_sep => ";", :row_sep => "\r\n") do |csv| 
      Page.find(:all).each do |page|
      end
    end
  end
  
  def default_by(by)
    by || 'Nobody!'
  end
end
