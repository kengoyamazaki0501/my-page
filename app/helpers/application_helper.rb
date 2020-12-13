module ApplicationHelper
  
  def twitter_url(name) 
    return if name.blank?
    link_to name, File.join('https://twitter.com', name)
  end
  def instagram_url(name)
    return if name.blank?
    link_to name, File.join('https://www.instagram.com', name)
  end
  def facebook_url(name)
    return if name.blank?
    link_to name, File.join('https://www.facebook.com', name)
  end
  def youtube_url(url)
    return if name.blank?
    link_to url,url 
  end

end
