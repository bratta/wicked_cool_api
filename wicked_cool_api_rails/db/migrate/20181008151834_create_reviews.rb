class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :restaurant, foreign_key: true
      t.string :username
      t.text :body
      t.integer :rating
      t.timestamps
    end
  end
end
