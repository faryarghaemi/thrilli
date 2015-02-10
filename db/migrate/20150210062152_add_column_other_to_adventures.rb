class AddColumnOtherToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :other, :string
  end
end
