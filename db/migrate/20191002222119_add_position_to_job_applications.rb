class AddPositionToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :position, :string
  end
end
