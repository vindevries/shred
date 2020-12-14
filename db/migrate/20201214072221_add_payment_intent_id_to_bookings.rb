class AddPaymentIntentIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :payment_intent_id, :string
  end
end
