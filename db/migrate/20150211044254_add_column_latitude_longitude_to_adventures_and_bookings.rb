class AddColumnLatitudeLongitudeToAdventuresAndBookings < ActiveRecord::Migration
  def change
    add_column :adventures, :latitude, :float
    add_column :adventures, :longitude, :float
    add_column :bookings, :latitude, :float
    add_column :bookings, :longitude, :float
  end
end
