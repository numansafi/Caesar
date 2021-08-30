class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.integer :number_of_people
      t.references :venue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
