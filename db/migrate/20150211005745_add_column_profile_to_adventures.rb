class AddColumnProfileToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :profile, :string 
  end
end
