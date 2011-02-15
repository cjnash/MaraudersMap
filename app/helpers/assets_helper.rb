module AssetsHelper
  
  def file_size(size)
    if size < 1000000
      "#{size/1000} KB"
    else
      "#{size/1000000} MB"
    end
  end
  
end
