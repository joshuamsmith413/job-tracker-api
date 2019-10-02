class AddContactToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :contact, :string
  end
end
