class AddColumnMessageToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :message, :text
  end
end
