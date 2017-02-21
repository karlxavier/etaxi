class AddColumnsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :status_id, :integer, default: 1
  end
end
