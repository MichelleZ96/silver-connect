# frozen_string_literal: true

class DeviseCreateApplicants < ActiveRecord::Migration[7.1]
  def change
    create_table :applicants do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :name
      t.string :experience_1_company
      t.integer :experience_1_duration_years
      t.string :experience_1_last_role
      t.integer :experience_1_industry
      t.integer :age
      t.string :experience_2_company
      t.integer :experience_2_duration_years
      t.string :experience_2_last_role
      t.string :experience_2_industry
      t.string :interested_industry_1
      t.string :interested_industry_2
      t.string :interested_industry_3
      t.string :interested_role_1
      t.string :interested_role_2
      t.string :interested_role_3
      t.integer :bookmarked_jobs_count

      t.timestamps null: false
    end

    add_index :applicants, :email,                unique: true
    add_index :applicants, :reset_password_token, unique: true
    # add_index :applicants, :confirmation_token,   unique: true
    # add_index :applicants, :unlock_token,         unique: true
  end
end
