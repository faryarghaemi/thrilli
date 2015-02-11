class AddColumnsLatAndLonToBookingsAndAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :lat, :float
    add_column :adventures, :lon, :float
    add_column :bookings, :lat, :float
    add_column :bookings, :lon, :float
  end
end
