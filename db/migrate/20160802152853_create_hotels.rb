class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :description
      t.string :location_name
      t.float :location_latitude
      t.float :location_longitude
      t.string :url

      t.timestamps
    end
  end
end
