class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :part_type
      t.string :description
      t.string :serial_number
      t.integer :bike_id
      t.float :distance_in_km
      t.float :lifetime_in_km
      t.integer :lifetime_in_days
      t.boolean :is_expired, {default: false}

      t.timestamps
    end
  end
end
