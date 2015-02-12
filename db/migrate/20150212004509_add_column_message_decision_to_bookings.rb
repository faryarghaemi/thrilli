class AddColumnMessageDecisionToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :message_decision, :text
  end
end
