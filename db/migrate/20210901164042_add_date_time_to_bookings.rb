class AddDateTimeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date_time, :datetime
  end
end
