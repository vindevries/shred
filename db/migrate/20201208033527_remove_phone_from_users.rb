class RemovePhoneFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :phone
    add_column :instructors, :phone, :string
  end
end
