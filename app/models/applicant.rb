# == Schema Information
#
# Table name: applicants
#
#  id                          :bigint           not null, primary key
#  age                         :integer
#  bookmarked_jobs_count       :integer
#  email                       :string           default(""), not null
#  encrypted_password          :string           default(""), not null
#  experience_1_company        :string
#  experience_1_duration_years :integer
#  experience_1_industry       :integer
#  experience_1_last_role      :string
#  experience_2_company        :string
#  experience_2_duration_years :integer
#  experience_2_industry       :string
#  experience_2_last_role      :string
#  interested_industry_1       :string
#  interested_industry_2       :string
#  interested_industry_3       :string
#  interested_role_1           :string
#  interested_role_2           :string
#  interested_role_3           :string
#  name                        :string
#  remember_created_at         :datetime
#  reset_password_sent_at      :datetime
#  reset_password_token        :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_applicants_on_email                 (email) UNIQUE
#  index_applicants_on_reset_password_token  (reset_password_token) UNIQUE
#
class Applicant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many  :bookmarked_jobs, class_name: "BookmarkedJob", foreign_key: "applicant_id", dependent: :destroy

  has_many :interested_job_postings, through: :bookmarked_jobs, source: :job_posting

  # validates :name, presence: true

  # validates :age, presence: true

  # validates :experience_1_last_role, presence: true

  # validates :experience_1_industry, presence: true

  # validates :experience_1_duration_years, presence: true

  # validates :experience_1_company, presence: true

  # validates :experience_2_last_role, presence: true

  # validates :experience_2_industry, presence: true

  # validates :experience_2_duration_years, presence: true

  # validates :experience_2_company, presence: true
  
  # validates :interested_role_1, presence: true

  # validates :interested_role_1, uniqueness: { scope: ["interested_role_3", "interested_role_2"] }

  # validates :interested_role_2, uniqueness: { scope: ["interested_role_1", "interested_role_3"] }

  # validates :interested_role_3, uniqueness: { scope: ["interested_role_1", "interested_role_2"] }

  # validates :interested_industry_1, presence: true

  # validates :interested_industry_1, uniqueness: { scope: ["interested_industry_2", "interested_industry_3"] }

  # validates :interested_industry_2, uniqueness: { scope: ["interested_industry_3", "interested_industry_1"] }

  # validates :interested_industry_3, uniqueness: { scope: ["interested_industry_2", "interested_industry_1"] }


end
