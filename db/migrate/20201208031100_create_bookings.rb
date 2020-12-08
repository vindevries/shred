class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :instructor_package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
