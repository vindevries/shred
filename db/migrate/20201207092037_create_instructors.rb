class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :gender
      t.text :description
      t.boolean :available

      t.timestamps
    end
  end
end
