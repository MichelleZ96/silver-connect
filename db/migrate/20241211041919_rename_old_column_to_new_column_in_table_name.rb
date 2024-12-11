class RenameOldColumnToNewColumnInTableName < ActiveRecord::Migration[7.1]
  def change
    rename_column :applicants, :experience_1_company, :last_experience_company
    rename_column :applicants, :experience_1_duration_years, :last_experience_duration_years
    rename_column :applicants, :experience_1_industry, :last_experience_industry
    rename_column :applicants, :experience_1_last_role, :last_experience_last_role
  end
end
