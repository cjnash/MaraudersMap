module PagesHelper
  
  def section_link
    @page.section.present? ? (link_to @page.section.name, section_path(@page.section)) : "Unknown"
  end
  
  def pretty_date(date)
    date.strftime('%d %b %Y at %I:%M %p') if date
  end
  
end
