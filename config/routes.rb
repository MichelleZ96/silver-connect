Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  
  get("/applicants/:id/profile", { :controller => "applicants", :action => "profile", :as => "applicant_profile" })
  get("/employers/:id/profile", { :controller => "employers", :action => "profile", :as => "employer_profile" })

  # Routes for the Bookmarked job resource:

  # CREATE
  post("/insert_bookmarked_job", { :controller => "bookmarked_jobs", :action => "create" })
          
  # READ
  get("/bookmarked_jobs", { :controller => "bookmarked_jobs", :action => "index" })
  
  get("/bookmarked_jobs/:path_id", { :controller => "bookmarked_jobs", :action => "show" })
  
  # # UPDATE
  
  post("/modify_bookmarked_job/:path_id", { :controller => "bookmarked_jobs", :action => "update" })
  
  # DELETE
  post("/delete_bookmarked_job/:path_id", { :controller => "bookmarked_jobs", :action => "destroy" })

  #------------------------------

  # Routes for the Job posting resource:

  # Employers can post after sign-in which gets updated to the job posting database
  # Then employer can view the job postings they have posted (not from other employers), and update individual job postings
  # Applicants can see all job postings from all employers (including bookmark status from themselves)
  # Applicants can add / remove bookmark to individual posting

  # CREATE
  post("/insert_job_posting", { :controller => "job_postings", :action => "create" }) #for employers

  # READ
  get("/job_postings/new", { :controller => "job_postings", :action => "new"}) #for employers

  get("/job_postings", { :controller => "job_postings", :action => "index" }) #for applicants

  get("/job_postings/employers/:id", { :controller => "job_postings", :action => "employ" }) #for employers
  
  # get("/job_postings/:id", { :controller => "job_postings", :action => "show" })

  get("/job_postings/:id/edit", { :controller => "job_postings", :action => "edit" }) #for employers
  
  # UPDATE
  
  post("/job_postings/:id/edit", { :controller => "job_postings", :action => "update" })
  
  # # DELETE
  get("/delete_job_posting/:path_id", { :controller => "job_postings", :action => "destroy" })

  #------------------------------

  devise_for :employers, path: 'employers'
  devise_for :applicants, path: 'applicants'
  
end
