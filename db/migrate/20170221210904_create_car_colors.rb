class CreateCarColors < ActiveRecord::Migration[5.0]
  def change
    create_table :car_colors do |t|
      t.string :name

      t.timestamps
    end
  end
end
