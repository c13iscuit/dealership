class ChangeDealershipsToManufacturers < ActiveRecord::Migration
  def up
    rename_table :dealerships, :manufacturers
  end

  def down
    rename_table :manufacturers, :dealerships
  end
end
