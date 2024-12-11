Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  
  get("/applicants/:id/profile", { :controller => "applicant", :action => "profile", :as => "applicant_profile" })
  get("/employers/:id/profile", { :controller => "employer", :action => "profile", :as => "employer_profile" })

  # Routes for the Bookmarked job resource:

  # CREATE
  post("/insert_bookmarked_job", { :controller => "bookmarked_jobs", :action => "create" })
          
  # READ
  get("/bookmarked_jobs", { :controller => "bookmarked_jobs", :action => "index" })
  
  get("/bookmarked_jobs/:path_id", { :controller => "bookmarked_jobs", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmarked_job/:path_id", { :controller => "bookmarked_jobs", :action => "update" })
  
  # DELETE
  get("/delete_bookmarked_job/:path_id", { :controller => "bookmarked_jobs", :action => "destroy" })

  #------------------------------

  # Routes for the Job posting resource:

  # CREATE
  post("/insert_job_posting", { :controller => "job_postings", :action => "create" })
          
  # READ
  get("/job_postings", { :controller => "job_postings", :action => "index" })
  
  get("/job_postings/:path_id", { :controller => "job_postings", :action => "show" })
  
  # UPDATE
  
  post("/modify_job_posting/:path_id", { :controller => "job_postings", :action => "update" })
  
  # DELETE
  get("/delete_job_posting/:path_id", { :controller => "job_postings", :action => "destroy" })

  #------------------------------

  devise_for :employers
  devise_for :applicants
  devise_for :applicants, controllers: { registrations: 'applicants/registrations' }

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
