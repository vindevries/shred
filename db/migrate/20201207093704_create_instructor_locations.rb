class CreateInstructorLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :instructor_locations do |t|
      t.references :instructor, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
