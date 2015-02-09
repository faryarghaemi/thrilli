class RemoveColumnAvailibilityFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :availibility 
  end
end
