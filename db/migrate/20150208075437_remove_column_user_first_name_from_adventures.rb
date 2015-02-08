class RemoveColumnUserFirstNameFromAdventures < ActiveRecord::Migration
  def change
    remove_column :adventures, :user_first_name
  end
end
