class AddColumnUserFirstNameToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :user_first_name, :string
  end
end
