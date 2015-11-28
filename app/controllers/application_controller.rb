class ApplicationController < ActionController::Base
  helper_method :get_device_code
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def smart_phone?(user_agent)
    return false if user_agent.nil?
    ['mobile', 'iphone', 'ipod', 'bb10', 'windows phone', 'nokia'].any? { |sp| user_agent.include? sp }
  end

  def tablet?(user_agent)
    return false if user_agent.nil?
    ['ipad'].any? { |tablet| user_agent.include?(tablet) } ||
      (user_agent.include?('android') && !user_agent.include?('mobile')) ||
        (user_agent.include?('trident') && user_agent.include?('touch'))
  end

  def get_device_code
    user_agent = request.user_agent.try(:downcase)
    if tablet?(user_agent)
      'T'
    elsif smart_phone?(user_agent)
      'SP'
    else
      'D'
    end
  end
end
