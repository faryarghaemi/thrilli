class AddColumnDisappearToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :disappear, :boolean, :default => false
  end
end
