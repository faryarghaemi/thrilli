class ChangeOvernightValue < ActiveRecord::Migration
  def change
    change_column :adventures, :overnight, :string
  end
end
