class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.text :options
      t.string :source
      t.string :image_url
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
