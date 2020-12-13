module ApplicationHelper
  
  def twitter_url(name)
    link_to name, File.join('https://twitter.com', name)
  end
  def instagram_url(name)
    link_to name, File.join('https://www.instagram.com', name)
  end
  def instagram_url(name)
    link_to name, File.join('https://www.facebook.com', name)
  end
  def youtube_url(url)
    link_to url,url 
  end

end
