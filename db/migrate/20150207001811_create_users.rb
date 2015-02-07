class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name 
      t.string :last_name 
      t.date :dob 
      t.string :email 
      t.text :password_digest
      t.integer :phone 
      t.string :gender 
      t.text :description 
      t.boolean :smoker 
      t.text :interests 
      t.boolean :car 
      t.string :car_type 
      t.integer :car_year 
      t.string :car_model 
      t.text :image 
      t.string :occupation 
      t.timestamps 
    end
  end
end
