class AddCurrentToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :current, :boolean, :default => true
  end
end
