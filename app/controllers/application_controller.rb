class ApplicationController < ActionController::Base
  skip_forgery_protection

  def after_sign_up_path_for(resource)
    if resource.is_a?(Applicant)
      applicant_profile_path(resource.id) # Redirect to the applicant's specific profile page
    elsif resource.is_a?(Employer)
      employer_profile_path(resource.id)  # Redirect to the employer's specific profile page
    else
      super # Default Devise behavior
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Applicant)
      applicant_profile_path(resource.id) # Redirect to the applicant's specific profile page
    elsif resource.is_a?(Employer)
      employer_profile_path(resource.id)  # Redirect to the employer's specific profile page
    else
      super # Default Devise behavior
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :last_experience_company, :last_experience_duration_years, :last_experience_industry, :last_experience_last_role, :interested_industry_1, :interested_industry_2, :interested_industry_3, :interested_role_1, :interested_role_2, :interested_role_3, :industry, :company_description, :for_profit_or_non_profit])
    devise_parameter_sanitizer.permit(:account_update, keys: [:age, :last_experience_company, :last_experience_duration_years, :last_experience_industry, :last_experience_last_role, :interested_industry_1, :interested_industry_2, :interested_industry_3, :interested_role_1, :interested_role_2, :interested_role_3, :industry, :company_description, :for_profit_or_non_profit])
  end
end
