class ApplicantsController < ApplicationController
  def profile
    @applicant = Applicant.find(params[:id]) # Find the specific applicant by ID

    render({ :template => "applicants/profile" })
  end
end

