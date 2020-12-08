class CreateInstructorPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :instructor_packages do |t|
      t.integer :price
      t.references :package, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
