class ApplicationController < ActionController::Base
  skip_forgery_protection

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :last_experience_company, :last_experience_duration_years, :last_experience_industry, :last_experience_last_role, :interested_industry_1, :interested_industry_2, :interested_industry_3, :interested_role_1, :interested_role_2, :interested_role_3])
    devise_parameter_sanitizer.permit(:account_update, keys: [:age, :last_experience_company, :last_experience_duration_years, :last_experience_industry, :last_experience_last_role, :interested_industry_1, :interested_industry_2, :interested_industry_3, :interested_role_1, :interested_role_2, :interested_role_3])
  end
end
