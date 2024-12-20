class BookmarkedJobsController < ApplicationController
  def index
    matching_bookmarked_jobs = BookmarkedJob.all

    @list_of_bookmarked_jobs = matching_bookmarked_jobs.order({ :created_at => :desc })

    render({ :template => "bookmarked_jobs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bookmarked_jobs = BookmarkedJob.where({ :id => the_id })

    @the_bookmarked_job = matching_bookmarked_jobs.at(0)

    render({ :template => "bookmarked_jobs/show" })
  end

  def create
    the_bookmarked_job = BookmarkedJob.new
    the_bookmarked_job.applicant_id = current_applicant.id
    the_bookmarked_job.job_posting_id = params.fetch("job_posting_id")

    if the_bookmarked_job.valid?
      the_bookmarked_job.save
      redirect_to("/job_postings", { :notice => "Bookmarked job created successfully." })
    else
      redirect_to("/job_postings", { :alert => the_bookmarked_job.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bookmarked_job = BookmarkedJob.where({ :id => the_id }).at(0)

    if the_bookmarked_job.nil?
      redirect_to("/job_postings", { :alert => "Bookmarked job not found." })
      return
    end

    the_bookmarked_job.applicant_id = current_applicant.id
    the_bookmarked_job.job_posting_id = params.fetch("job_posting_id")

    if the_bookmarked_job.valid?
      the_bookmarked_job.save
      redirect_to("/job_postings", { :notice => "Bookmarked job updated successfully."} )
    else
      redirect_to("/job_postings", { :alert => the_bookmarked_job.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_job_posting_id = params.fetch("path_id")
    the_bookmarked_job = current_applicant.bookmarked_jobs.where({ :job_posting_id => the_job_posting_id }).at(0)

    if the_bookmarked_job.nil?
      redirect_to("/job_postings", { :alert => "Bookmarked job not found." })
      return
    end

    the_bookmarked_job.destroy
    redirect_to("/job_postings", { :notice => "Bookmarked job deleted successfully." })
  end
end
