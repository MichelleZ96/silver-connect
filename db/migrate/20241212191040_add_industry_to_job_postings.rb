class AddIndustryToJobPostings < ActiveRecord::Migration[7.1]
  def change
    add_column :job_postings, :industry, :string
  end
end
