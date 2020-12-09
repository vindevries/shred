class RemoveInstructorFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :instructor, :string
  end
end
