# == Schema Information
#
# Table name: job_postings
#
#  id                     :bigint           not null, primary key
#  bookmarked_jobs_count  :integer
#  desired_qualifications :text
#  logistics              :text
#  pay_range              :string
#  responsibilities       :text
#  title                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employer_id            :integer
#
class JobPosting < ApplicationRecord
end
