module HandlerExceptions extend ActiveSupport::Concern
  class InvalidToken < StandardError; end
  class ExpiredToken < StandardError; end
  included do
    rescue_from HandlerExceptions::InvalidToken do |_error|
      render json: {message: "Access denied! Invalid token"}, status: :unauthorized
    end
    rescue_from HandlerExceptions::ExpiredToken do |_error|
      render json: {message: "Access denied! Token expired"}, status: :unauthorized
    end
    rescue_from ActiveRecord::RecordNotFound do |_error|
      render json: {message: "Id not found"}
    end
  end
end