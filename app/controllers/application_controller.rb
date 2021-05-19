class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include HandlerExceptions

  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, status: 403
  end

  def current_user
    if token
      @actual_user ||= User.find(token[:user_id])
    else
      @actual_user ||= User.new(role_id: 3)
    end
  end

  private
  def token
    value = request.headers[:Authorization]
    return if value.blank?
    @token ||= JsonWebToken.decode(value.split(" ").last)
  end
  
end