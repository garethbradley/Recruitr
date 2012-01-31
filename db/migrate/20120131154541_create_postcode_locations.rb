class CreatePostcodeLocations < ActiveRecord::Migration
  def change
    create_table :postcode_locations do |t|
      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :postcode_locations, :postcode, :unique => true
  end
end

