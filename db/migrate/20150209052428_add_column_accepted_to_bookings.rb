class AddColumnAcceptedToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :accepted, :string 
  end
end
