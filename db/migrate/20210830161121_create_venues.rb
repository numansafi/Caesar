class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :venue_type
      t.string :venue_attributes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
