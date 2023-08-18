class ApplicationController < ActionController::Base
  # Basic認証
  before_action :basic_auth
  # Basic認証


  private

  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
  # Basic認証
end
