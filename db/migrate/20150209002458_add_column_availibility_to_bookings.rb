class AddColumnAvailibilityToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :availibility, :datetime
  end
end
