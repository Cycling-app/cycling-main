class Activities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :activity
      t.integer :strava_id
      t.float :mileage
      t.integer :client_id
      t.integer :bike_id
    end
  end
end
