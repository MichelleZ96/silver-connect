class CreateJobPostings < ActiveRecord::Migration[7.1]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :responsibilities
      t.text :desired_qualifications
      t.text :logistics
      t.string :pay_range
      t.integer :employer_id
      t.integer :bookmarked_jobs_count

      t.timestamps
    end
  end
end
