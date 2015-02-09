class AddColumnsCheckinCheckoutToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :checkin, :datetime
    add_column :adventures, :checkout, :datetime 
  end
end
