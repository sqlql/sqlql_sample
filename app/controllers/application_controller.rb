class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token|
      @user = User.find_by(key: token)
    end
  end

  def render_unauthorized
    render json: { message: 'だれだ' }, status: :unauthorized
  end
end
