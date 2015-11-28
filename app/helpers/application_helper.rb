module ApplicationHelper
	require 'net/http'
  require 'uri'
  require 'open-uri'
  def render_header
  	if get_device_code == 'D'
  	  render 'header'
  	else
  		render 'smartphone_common_header'
  	end
  end
end
