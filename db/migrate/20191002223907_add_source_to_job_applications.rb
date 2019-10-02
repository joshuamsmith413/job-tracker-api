class AddSourceToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :source, :string
  end
end
