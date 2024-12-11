class EmployersController < ApplicationController
  def profile
    @employer = Employer.find(params[:id]) # Find the specific employer by ID

    render({ :template => "employers/profile" })
  end
end
