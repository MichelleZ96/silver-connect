class RemoveColumnFromApplicants < ActiveRecord::Migration[7.1]
  def change
    remove_column :applicants, :experience_2_company, :string
    remove_column :applicants, :experience_2_duration_years, :integer
    remove_column :applicants, :experience_2_industry, :string
    remove_column :applicants, :experience_2_last_role, :string
  end
end
