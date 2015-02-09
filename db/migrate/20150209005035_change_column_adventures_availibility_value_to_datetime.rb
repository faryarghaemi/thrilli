class ChangeColumnAdventuresAvailibilityValueToDatetime < ActiveRecord::Migration
  def change
    remove_column :adventures, :availability
  end
end
