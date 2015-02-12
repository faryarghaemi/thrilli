class AddColumnsCityPickupCityActivityToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :city_pickup, :string
    add_column :adventures, :city_activity, :string
  end
end
