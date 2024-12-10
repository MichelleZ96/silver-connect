# == Schema Information
#
# Table name: employers
#
#  id                       :bigint           not null, primary key
#  company_description      :text
#  email                    :string           default(""), not null
#  encrypted_password       :string           default(""), not null
#  for_profit_or_non_profit :string
#  industry                 :string
#  job_postings_count       :integer
#  name                     :string
#  remember_created_at      :datetime
#  reset_password_sent_at   :datetime
#  reset_password_token     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_employers_on_email                 (email) UNIQUE
#  index_employers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Employer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many  :job_postings, class_name: "JobPosting", foreign_key: "employer_id", dependent: :destroy

  validates :name, presence: true

  validates :industry, presence: true

  validates :for_profit_or_non_profit, presence: true

  validates :company_description, presence: true
end
