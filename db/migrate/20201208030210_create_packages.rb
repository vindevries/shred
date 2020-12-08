class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.integer :duration
      t.boolean :photographer
      t.string :title
      t.boolean :rental

      t.timestamps
    end
  end
end
