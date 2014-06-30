class AddManufacturers < ActiveRecord::Migration
  def change
    create_table :dealerships do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.timestamps
    end
  end
end
