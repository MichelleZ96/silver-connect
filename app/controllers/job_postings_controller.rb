class JobPostingsController < ApplicationController
  def edit
    the_id = params.fetch("id")
    @the_job_posting = JobPosting.where({ :id => the_id }).at(0)
    
    render({ :template => "job_postings/edit" })
  end
  
  def new
    render({ :template => "job_postings/new"})
  end

  def employ
    @job_postings = current_employer.job_postings
    render({ :template => "employers/job_postings" })
  end

  def index
    matching_job_postings = JobPosting.all

    @list_of_job_postings = matching_job_postings.order({ :created_at => :desc })

    render({ :template => "job_postings/index" })
  end

  # def show
  #   the_id = params.fetch("path_id")

  #   matching_job_postings = JobPosting.where({ :id => the_id })

  #   @the_job_posting = matching_job_postings.at(0)

  #   render({ :template => "job_postings/show" })
  # end

  def create
    the_job_posting = JobPosting.new
    the_job_posting.title = params.fetch("query_title")
    the_job_posting.responsibilities = params.fetch("query_responsibilities")
    the_job_posting.desired_qualifications = params.fetch("query_desired_qualifications")
    the_job_posting.logistics = params.fetch("query_logistics")
    the_job_posting.pay_range = params.fetch("query_pay_range")
    the_job_posting.employer_id = current_employer.id
    the_job_posting.industry = current_employer.industry

    if the_job_posting.valid?
      the_job_posting.save
      redirect_to("/job_postings/employers/#{current_employer.id}", { :notice => "Job posting created successfully." })
    else
      redirect_to("/job_postings/employers/#{current_employer.id}", { :alert => the_job_posting.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("id")
    the_job_posting = JobPosting.where({ :id => the_id }).at(0)

    the_job_posting.title = params.fetch("query_title")
    the_job_posting.responsibilities = params.fetch("query_responsibilities")
    the_job_posting.desired_qualifications = params.fetch("query_desired_qualifications")
    the_job_posting.logistics = params.fetch("query_logistics")
    the_job_posting.pay_range = params.fetch("query_pay_range")
    the_job_posting.employer_id = current_employer.id
    the_job_posting.industry = current_employer.industry

    if the_job_posting.valid?
      the_job_posting.save
      redirect_to("/job_postings/employers/#{current_employer.id}", { :notice => "Job posting updated successfully."} )
    else
      redirect_to("/job_postings/employers/#{current_employer.id}", { :alert => the_job_posting.errors.full_messages.to_sentence })
    end
  end

  # def destroy
  #   the_id = params.fetch("path_id")
  #   the_job_posting = JobPosting.where({ :id => the_id }).at(0)

  #   the_job_posting.destroy

  #   redirect_to("/job_postings", { :notice => "Job posting deleted successfully."} )
  # end
end
