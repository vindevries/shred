class CreateInstructorLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :instructor_languages do |t|
      t.references :instructor, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
