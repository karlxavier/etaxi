class CreateCarImages < ActiveRecord::Migration[5.0]
  def change
    create_table :car_images do |t|
      t.integer :car_id
      t.string :image

      t.timestamps
    end
  end
end
