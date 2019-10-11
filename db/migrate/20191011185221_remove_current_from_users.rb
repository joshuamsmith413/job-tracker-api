class RemoveCurrentFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :current, :boolean

  end
end
