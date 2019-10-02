class AddOneWeekCheckupToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :one_week_checkup, :boolean, :default => false
  end
end
