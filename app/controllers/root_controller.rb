# encoding: utf-8
class RootController < ApplicationController
  def index
    
    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  end
  
  def country
    
    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def category
    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&videoCategoryId=#{params[:s]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
    
  	
  end

  def limit
    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
    
  	
  end

  def country_category
    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&videoCategoryId=#{params[:s]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def country_limit
    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def country_category_limit
    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&videoCategoryId=#{params[:s]}&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def category_limit

    api_request = "#{CONFIG['HOST']}?part=snippet&chart=mostPopular&videoCategoryId=#{params[:s]}&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end


end
