class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place_name
      t.decimal :place_lat, :precision => 15, :scale => 10
      t.decimal :place_log, :precision => 15, :scale => 10
      t.string :place_address
      t.string :place_opening_time_1   
      t.string :place_opening_time_2
      t.string :place_opening_time_3
      t.string :place_opening_time_4
      t.string :place_phone_number
      t.string :place_email
      t.string :place_image_url

      t.timestamps
    end
  end
end
