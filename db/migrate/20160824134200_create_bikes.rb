class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :serial_number
      t.string :make
      t.string :brand
      t.integer :client_id
      t.date :bought_on

      t.timestamps
    end
  end
end
