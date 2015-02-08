class AddCreatorIdToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :creator_id, :integer 
  end
end
