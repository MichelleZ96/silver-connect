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
end
