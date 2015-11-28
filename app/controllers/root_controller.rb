# encoding: utf-8
class RootController < ApplicationController
  def index
    yesterday_date = CGI.escape(Date.yesterday.rfc3339)
    funny_videos_api_request = "#{CONFIG['SEARCH_HOST']}?part=snippet&publishedAfter=#{yesterday_date}&q=funny+videos&key=#{CONFIG['YOUTUBE_KEY']}"
    @funny_videos = HTTParty.get funny_videos_api_request
    @funny_vid_ids = []
    funny_vid_id_request = ''
    @funny_videos['items'].each do |item|
      funny_vid_id_request = funny_vid_id_request + item['id']['videoId'] + '%2C+'
    end
    funny_vid_id_request = funny_vid_id_request.slice(0..-5)
    funny_videos_stats_request = "#{CONFIG['VIDEOS_HOST']}?part=statistics&id=#{funny_vid_id_request}&key=#{CONFIG['YOUTUBE_KEY']}"
    @funny_videos_stats = HTTParty.get funny_videos_stats_request

    news_videos_api_request = "#{CONFIG['SEARCH_HOST']}?part=snippet&publishedAfter=#{yesterday_date}&q=bbc+news&key=#{CONFIG['YOUTUBE_KEY']}"
    @news_videos = HTTParty.get news_videos_api_request
    @news_vid_ids = []
    news_vid_id_request = ''
    @news_videos['items'].each do |item|
      news_vid_id_request = news_vid_id_request + item['id']['videoId'] + '%2C+'
    end
    news_vid_id_request = news_vid_id_request.slice(0..-5)
    news_videos_stats_request = "#{CONFIG['VIDEOS_HOST']}?part=statistics&id=#{news_vid_id_request}&key=#{CONFIG['YOUTUBE_KEY']}"
    @news_videos_stats = HTTParty.get news_videos_stats_request

    music_videos_api_request = "#{CONFIG['SEARCH_HOST']}?part=snippet&publishedAfter=#{yesterday_date}&q=music+video&key=#{CONFIG['YOUTUBE_KEY']}"
    @music_videos = HTTParty.get music_videos_api_request
    @music_vid_ids = []
    music_vid_id_request = ''
    @music_videos['items'].each do |item|
      music_vid_id_request = music_vid_id_request + item['id']['videoId'] + '%2C+'
    end
    music_vid_id_request = music_vid_id_request.slice(0..-5)
    music_videos_stats_request = "#{CONFIG['VIDEOS_HOST']}?part=statistics&id=#{music_vid_id_request}&key=#{CONFIG['YOUTUBE_KEY']}"
    @music_videos_stats = HTTParty.get music_videos_stats_request
  end

  def most_popular
    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&key=#{CONFIG['YOUTUBE_KEY']}"
    test = smart_phone?(request.user_agent.try(:downcase))
    
    @result = HTTParty.get api_request
  end
  
  def country
    
    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def category
    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&videoCategoryId=#{params[:s]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
    
  	
  end

  def limit
    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
    
  	
  end

  def country_category
    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&videoCategoryId=#{params[:s]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def country_limit
    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def country_category_limit
    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&regionCode=#{params[:c]}&videoCategoryId=#{params[:s]}&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end

  def category_limit

    api_request = "#{CONFIG['VIDEOS_HOST']}?part=snippet&chart=mostPopular&videoCategoryId=#{params[:s]}&maxResults=#{params[:n]}&key=#{CONFIG['YOUTUBE_KEY']}"
    @result = HTTParty.get api_request
  	
  end


end
