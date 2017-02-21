class CreateCarBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :car_brands do |t|
      t.string :name

      t.timestamps
    end
    rename_column :cars, :brand_id, :car_brand_id
    rename_column :cars, :model_id, :car_model_id
    rename_column :cars, :status_id, :car_status_id
  end
end
