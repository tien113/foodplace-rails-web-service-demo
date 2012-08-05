class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :food_name
      t.decimal :food_price, :precision => 7, :scale => 2
      t.string :food_image_url
      t.text :food_ingredient
      t.references :place

      t.timestamps
    end
    add_index :foods, :place_id
  end
end
