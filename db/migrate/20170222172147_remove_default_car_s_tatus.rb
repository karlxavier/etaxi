class RemoveDefaultCarSTatus < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:cars, :car_status_id, nil)
  end
end
