class ChangeColumnValueCityPickupCityActivityToText < ActiveRecord::Migration
  def change
    change_column :adventures, :city_pickup, :text
    change_column :adventures, :city_activity, :text
  end
end
