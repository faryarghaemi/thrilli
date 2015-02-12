class RemoveColumnsLatLonLatitudeLongitudeFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :latitude
    remove_column :bookings, :longitude
    remove_column :bookings, :lat
    remove_column :bookings, :lon
  end
end
