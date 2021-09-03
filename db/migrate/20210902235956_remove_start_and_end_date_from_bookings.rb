class RemoveStartAndEndDateFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :start_date_time, :datetime
    remove_column :bookings, :end_date_time, :datetime
  end
end
