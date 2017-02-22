class AddColumnPrimaryImageToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :primary_image, :string
  end
end
