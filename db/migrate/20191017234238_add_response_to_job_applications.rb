class AddResponseToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :response, :boolean, :default => false
  end
end
