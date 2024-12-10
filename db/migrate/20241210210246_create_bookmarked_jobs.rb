class CreateBookmarkedJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarked_jobs do |t|
      t.integer :applicant_id
      t.integer :job_posting_id

      t.timestamps
    end
  end
end
