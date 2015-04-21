class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_diguest, null: false
      t.string :city, null: false
      t.string :profession, null: false
    end
    
    add_index :users, :username
    add_index :users, :city
  end
end
