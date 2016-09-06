class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :part_type
      t.string :description
      t.string :serial_number
      t.integer :bike_id
      t.date :mounted_on
      t.date :purchased_on
      t.float :distance_in_km, { default: 0.0 }
      t.float :expected_lifetime_in_km, { default: 750.0 }
      t.boolean :is_expired, { default: false }

      t.timestamps
    end
  end
end
