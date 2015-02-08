class RemoveColumnAdventuresCreatorId < ActiveRecord::Migration
  def change
    remove_column :adventures, :creator_id 
  end
end
