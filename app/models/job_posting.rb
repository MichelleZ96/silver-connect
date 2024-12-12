# == Schema Information
#
# Table name: job_postings
#
#  id                     :bigint           not null, primary key
#  bookmarked_jobs_count  :integer
#  desired_qualifications :text
#  industry               :string
#  logistics              :text
#  pay_range              :string
#  responsibilities       :text
#  title                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employer_id            :integer
#

class JobPosting < ApplicationRecord
  belongs_to :employer, required: true, class_name: "Employer", foreign_key: "employer_id", counter_cache: true

  has_many  :bookmarked_jobs, class_name: "BookmarkedJob", foreign_key: "job_posting_id", dependent: :destroy

  has_many :interested_applicants, through: :bookmarked_jobs, source: :applicants

  validates :title, presence: true

  validates :responsibilities, presence: true

  validates :pay_range, presence: true

  validates :logistics, presence: true

  validates :desired_qualifications, presence: true
end
