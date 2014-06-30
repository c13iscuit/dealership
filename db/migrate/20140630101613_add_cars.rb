class AddCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :manufaturer_id, null: false
      t.text :description
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
    end
  end
end
