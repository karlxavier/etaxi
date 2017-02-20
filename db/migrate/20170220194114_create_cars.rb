class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
    	t.string :reference_code
    	t.string :year
    	t.string :mileage
    	t.string :power
    	t.string :engine
    	t.decimal :price, :precision => 30, :scale => 10
    	t.integer :brand_id
    	t.integer :model_id
    	t.integer :fuel_type_id
    	t.integer :car_color_id

      t.timestamps
    end
  end
end
