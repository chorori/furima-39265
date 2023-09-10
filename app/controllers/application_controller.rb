class ApplicationController < ActionController::Base
  # Basic認証
  before_action :basic_auth
  # Basic認証
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
  # Basic認証

  # ストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthdate])
  end

end
