class AddColumnsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :price, :integer
    add_column :bookings, :payment, :string, default: "pending"
    add_column :bookings, :checkout_session_id, :string
  end
end
