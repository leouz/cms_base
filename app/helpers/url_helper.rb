# -*- encoding : utf-8 -*-
module UrlHelper  
  def domain
    ENV["APP_DOMAIN"]
  end

  def base_url *path
    raise 'ENV variable APP_BASE_URL not set' unless ENV["APP_BASE_URL"]        
    base = ENV["APP_BASE_URL"]
    path = path.select{ |p| p != "/" and p != nil }    
    (path.any? ? URI::join(base, *path) : base).to_s
  end

  def current_full_url
    base_url request.original_fullpath
  end
end
