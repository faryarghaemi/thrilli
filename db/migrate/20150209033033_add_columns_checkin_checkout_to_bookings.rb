class AddColumnsCheckinCheckoutToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :checkin, :datetime 
    add_column :bookings, :checkout, :datetime 
  end
end
