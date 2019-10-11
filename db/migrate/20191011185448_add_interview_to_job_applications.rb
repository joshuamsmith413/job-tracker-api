class AddInterviewToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :interview, :boolean, :default => false
  end
end
