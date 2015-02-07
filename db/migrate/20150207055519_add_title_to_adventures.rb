class AddTitleToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :title, :string
  end
end
