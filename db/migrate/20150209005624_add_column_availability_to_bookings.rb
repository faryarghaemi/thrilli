class AddColumnAvailabilityToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :availability, :datetime
  end
end
