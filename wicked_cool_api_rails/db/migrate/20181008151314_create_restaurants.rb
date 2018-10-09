class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    # name, price, rating, address1, address2, city, state, zip, phone
    create_table :restaurants do |t|
      t.string :name
      t.integer :price_level
      t.integer :rating
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.timestamps
    end
  end
end
