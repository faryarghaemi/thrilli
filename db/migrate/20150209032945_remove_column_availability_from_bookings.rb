class RemoveColumnAvailabilityFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :availability 
  end
end
