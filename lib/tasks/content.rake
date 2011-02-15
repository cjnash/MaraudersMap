namespace :content do
  
  MENUS = ['menu.yaml', 'menu-sub.yaml']
  
  SECTION_ASSETS = {
    'content/images' => ['All'],
    'content/images/auto-driving/' => ['Auto & Driving'],
    'content/images/bu-logos/' => ['All'],
    'content/images/buttons/' => ['All'],
    'content/images/community-ama/' => ['Community & AMA'],
    'content/images/deals-discounts/' => ['Deals & Discounts'],
    'content/images/driver-education/' => ['Driver Education'],
    'content/images/financial/' => ['Financial'],
    'content/images/icons/' => ['All'],
    'content/images/insurance/' => ['Insurance'],
    'content/images/my-subfolder/' => ['All'],
    'content/images/promos/' => ['All'],
    'content/images/registries/' => ['Registries'],
    'content/images/road-reports/' => ['Auto & Driving'],
    'content/images/test-subfolder/' => ['All'],
    'content/images/test-subfolder-2/' => ['All']
  }
  
  def folder_contents(folder)
    Dir.glob(File.join(folder.path,'*.*')).each do |file_path|
      asset = folder.assets.find_by_file_name(File.basename(file_path))
      asset = Asset.new if asset.nil?
      asset.file_name = File.basename(file_path)
      asset.size = File.size(file_path)
      asset.file_type = File.extname(file_path).downcase
      asset.published_date = DateTime.parse(File.mtime(file_path).to_s)
      asset.online = true
      folder.assets << asset if asset.new_record?
      asset.save
    end
  end
  
  def folder_sections(folder)
    sections = SECTION_ASSETS[folder.path]
    sections.each do |section_name|
      if section_name == 'All'
        folder.sections = Section.all
      else
        section = Section.find_by_name(section_name)
        folder.sections << section unless folder.sections.include?(section)
      end
    end if sections.present?
  end
  
  def folder(path)
    folder = Folder.find_by_path(path)
    folder = Folder.new(:path => path) if folder.nil?
    folder.online = true
    folder_sections(folder)
    folder
  end
  
  def clear_assets
    Asset.all do |a|
      a.online = false
      a.save
    end
    Folder.all do |f|
      f.online = false
      f.save
    end
  end
  
  def navigation_url(section, url)
    url = "#{section}/#{File.basename(url, File.extname(url))}" unless (url.include?('http:') || url.include?('https:'))
    url
  end
  
  def second_level_nav(meta)
    nav = SecondLevelNav.find_by_cms_page_id(meta['id'])
    nav = SecondLevelNav.new(:cms_page_id => meta['id']) if nav.nil?
    nav.name = meta['name']
    nav.online = true
    return nav
  end
  
  def third_level_nav(meta)
    nav = ThirdLevelNav.find_by_cms_page_id(meta['id'])
    nav = ThirdLevelNav.new(:cms_page_id => meta['id']) if nav.nil?
    nav.name = meta['name']
    nav.online = true
    return nav
  end
  
  def attach_page_to_nav(page)
    if page.second_level?
      navigation = SecondLevelNav.find_by_cms_page_id(page.metadata.nav2)
      if navigation.present?
        navigation.page = page
        navigation.save
      end
    elsif page.third_level?
      navigation = ThirdLevelNav.find_by_cms_page_id(page.metadata.nav3)
      if navigation.present?
        if navigation.direct_link?page.url
          navigation.page = page
          navigation.save
        else
          navigation.hidden_pages << page unless navigation.hidden_pages.include?(page)
          navigation.save
        end
        navigation.page = page
        navigation.save
      end
    end
  end
  
  def page_data(file_name)
    invalid = MENUS.include?file_name
    begin
      yaml = YAML.load_file(file_name)
    rescue
      invalid = true
    end if !invalid
    
    if !invalid
      invalid = yaml['id'].nil?
    end
    if !invalid
      page = Page.find_by_cms_page_id(yaml['id'])
      if page.nil?
        page = Page.new(:cms_page_id => yaml['id'])
        page.metadata = Metadata.new
      end
      page_name = File.basename(file_name, File.extname(file_name))
      page.file_name = "#{page_name}.html.erb"
      page.published_date = DateTime.parse(File.mtime(file_name).to_s)
      page.online = true
      page.metadata.author = yaml['author']
      page.metadata.editor = yaml['editor']
      page.metadata.browser_title = yaml['browserTitle']
      page.metadata.content_title = yaml['contentTitle']
      page.metadata.nav2 = yaml['nav2']
      page.metadata.nav3 = yaml['nav3']
      page.metadata.keywords = yaml['meta']['keywords']
      page.metadata.description = yaml['meta']['description']
      page.metadata.online = true
      yaml['publishers'].split(/ /).each do |publisher|
        user = User.find_by_username(publisher.strip)
        page.users << user unless (user.nil? || page.users.include?(user))
      end unless yaml['publishers'].nil?
    end
    return page
  end
  
  def clear_navigation(section)
    section.second_level_navs.each do |nav2|
      nav2.third_level_navs.each do |nav3|
        nav3.online = false
      end
      nav2.online = false
      nav2.save
    end
  end
  
  def clear_pages(section)
    section.pages.each do |page|
      page.online = false
      page.metadata.online = false
      page.save
      page.metadata.save
    end if section.pages
  end
  
  task :sync => :environment do
    system("rsync -rzt --delete deploy@staging.amaabca.com:public_html/amaabca/current/content/* #{Rails.root.join('content')}")
  end
  
  namespace :import do
    task :navigation => :environment do
      Section.find(:all).each do |section|
        clear_navigation(section)
        section.menu_meta['second-level-nav'].each do |nav_meta_2|
          second_nav = second_level_nav(nav_meta_2)
          second_nav.url = navigation_url(section.path, nav_meta_2['url'])
          nav_meta_2['third-level-nav'].each do |nav_meta_3|
            third_nav = third_level_nav(nav_meta_3)
            third_nav.url = navigation_url(section.path, nav_meta_3['url'])
            second_nav.third_level_navs << third_nav if third_nav.new_record?
            third_nav.save
          end if nav_meta_2['third-level-nav'].kind_of?(Array)
          section.second_level_navs << second_nav if second_nav.new_record?
          second_nav.save
        end
        section.save
      end
    end
  
    task :pages => :environment do
      Section.find(:all).each do |section|
        clear_pages(section)
        content_files = Dir.glob(File.join('content',section.path,'*.yaml'))
        content_files.each do |file|
          page = page_data(file)
          unless page.nil?
            section.pages << page if page.new_record?
            attach_page_to_nav(page)
            page.metadata.save
            page.save
          end
        end
        section.save
      end
    end
  
    task :assets => :environment do
      clear_assets
      asset_folder = folder(File.join('content','images'))
      folder_contents(asset_folder)
      Pathname.glob(File.join(asset_folder.path,'*/')).each do |sf|
        subfolder = folder(sf)
        folder_contents(subfolder)
        asset_folder.folders << subfolder if subfolder.new_record?
        subfolder.save
      end
      asset_folder.save
    end
    
  end
  
  task :import => ['content:import:navigation', 'content:import:pages', 'content:import:assets']
  
end