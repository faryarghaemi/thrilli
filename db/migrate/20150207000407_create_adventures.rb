class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :offer_type 
      t.string :adventure_type 
      t.text :image 
      t.text :pickup_location 
      t.text :activity_location 
      t.text :availability
      t.text :description 
      t.integer :seats 
      t.string :difficulty
      t.string :gender_preference 
      t.string :sponsor_company 
      t.text :extras 
      t.integer :age_limit 
      t.text :duration 
      t.boolean :overnight 
      t.timestamps
    end
  end
end
