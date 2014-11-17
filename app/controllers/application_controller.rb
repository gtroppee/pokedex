class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_fake_ip_address
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
      [:account_update, :sign_up].each do |action|
        devise_parameter_sanitizer.for(action) { |u| u.permit(
      	 :name,
         :age,
         :bio,
         :gender,
         :age,
         :password,
         :password_confirmation,
         :email
         ) }
      end   
    end

    def set_fake_ip_address
      env['HTTP_X_REAL_IP'] = '81.48.177.151' if Rails.env.development?
    end
end
