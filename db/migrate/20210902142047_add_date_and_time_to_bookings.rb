class AddDateAndTimeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date, :date
    add_column :bookings, :time, :time
  end
end
