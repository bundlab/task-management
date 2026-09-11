class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session

  # JWT Authentication
  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
