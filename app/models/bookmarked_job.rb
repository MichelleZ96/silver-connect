# == Schema Information
#
# Table name: bookmarked_jobs
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  applicant_id   :integer
#  job_posting_id :integer
#
class BookmarkedJob < ApplicationRecord
  belongs_to :user, required: true, class_name: "Applicant", foreign_key: "applicant_id", counter_cache: true

  belongs_to :job_posting, required: true, class_name: "JobPosting", foreign_key: "job_posting_id", counter_cache: true
end
