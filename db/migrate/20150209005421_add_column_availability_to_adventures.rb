class AddColumnAvailabilityToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :availability, :datetime
  end
end
