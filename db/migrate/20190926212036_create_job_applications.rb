class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.string "company"
      t.string "cover_letter"
      t.integer "user_id"
      t.timestamps
    end
  end
end
