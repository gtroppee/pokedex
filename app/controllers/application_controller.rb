class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_fake_ip_address

  protected
    def set_fake_ip_address
      env['HTTP_X_REAL_IP'] = '81.48.177.151' if Rails.env.development?
    end
end
