class ChangeColumnTypeInApplicants < ActiveRecord::Migration[7.1]
  def change
    remove_column :applicants, :last_experience_industry, :integer
    add_column :applicants, :last_experience_industry, :string
  end
end
