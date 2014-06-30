class ChangeSpellingOfManufacturerId < ActiveRecord::Migration
  def change
    rename_column :cars, :manufaturer_id, :manufacturer_id
  end
end
